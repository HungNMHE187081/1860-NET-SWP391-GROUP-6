package controller;

import dal.MedicineDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MedicalRecordDAO;
import model.MedicalRecord;
import dal.StaffDAO;
import java.util.List;
import model.Medicine;
import model.Staff;
import model.Children;
import dal.ChildrenDAO;
import dal.PrescriptionDAO;
import model.Prescription;
import java.sql.SQLException;

public class AddPrescriptionServlet extends HttpServlet {
    private PrescriptionDAO prescriptionDAO;

    @Override
    public void init() throws ServletException {
        prescriptionDAO = new PrescriptionDAO(); // Initialize the DAO here
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddPrescriptionServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPrescriptionServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String recordID_raw = request.getParameter("id");
        try {
            int recordID = Integer.parseInt(recordID_raw);
            MedicalRecordDAO mdao = new MedicalRecordDAO();
            MedicalRecord record = mdao.getMedicalRecordByID(recordID);
            StaffDAO sdao = new StaffDAO();
            Staff staff = sdao.getStaffByID(record.getStaffID());
            MedicineDAO medicineDAO = new MedicineDAO();
            List<Medicine> medicineList = medicineDAO.getAllMedicines();
            ChildrenDAO cdao = new ChildrenDAO();
            Children children = cdao.getChildrenByID(record.getChildID());
            request.setAttribute("children", children);
            request.setAttribute("medicineList", medicineList);
            request.setAttribute("record", record);
            request.setAttribute("staff", staff);
            request.getRequestDispatcher("/Staff_JSP/add-prescription.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Improved error handling
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to process request.");
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Retrieve form parameters
            int recordID = Integer.parseInt(request.getParameter("recordID"));
            int medicineID = Integer.parseInt(request.getParameter("medicineId"));
            String dosage = request.getParameter("dosage");
            String frequency = request.getParameter("frequency");
            String duration = request.getParameter("duration");

            // Create a new Prescription object
            Prescription prescription = new Prescription();
            prescription.setRecordID(recordID);
            prescription.setMedicineID(medicineID);
            prescription.setDosage(dosage);
            prescription.setFrequency(frequency);
            prescription.setDuration(duration);

            // Add prescription using DAO
            prescriptionDAO.addPrescription(prescription);
            response.sendRedirect(request.getContextPath() + "/listprescription?success=true");
        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace(); 
        } catch (Exception e) {
            e.printStackTrace(); 
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
