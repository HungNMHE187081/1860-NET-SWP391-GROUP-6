package controller;

import dal.MedicineDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MedicalRecordDAO;
import model.MedicalRecord;
import dal.StaffDAO;
import model.Medicine;
import model.Staff;
import model.Children;
import dal.ChildrenDAO;
import dal.PrescriptionDAO;
import model.Prescription;

public class AddPrescriptionServlet extends HttpServlet {
    private PrescriptionDAO prescriptionDAO;
    private MedicalRecordDAO medicalRecordDAO;
    private StaffDAO staffDAO;
    private MedicineDAO medicineDAO;
    private ChildrenDAO childrenDAO;

    @Override
    public void init() throws ServletException {
        prescriptionDAO = new PrescriptionDAO();
        medicalRecordDAO = new MedicalRecordDAO();
        staffDAO = new StaffDAO();
        medicineDAO = new MedicineDAO();
        childrenDAO = new ChildrenDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String recordID_raw = request.getParameter("id");
        try {
            int recordID = Integer.parseInt(recordID_raw);
            MedicalRecord record = medicalRecordDAO.getMedicalRecordByID(recordID);
            Staff staff = staffDAO.getStaffByID(record.getStaffID());
            List<Medicine> medicineList = medicineDAO.getAllMedicines();
            Children children = childrenDAO.getChildrenByID(record.getChildID());

            request.setAttribute("children", children);
            request.setAttribute("medicineList", medicineList);
            request.setAttribute("record", record);
            request.setAttribute("staff", staff);
            request.getRequestDispatcher("/Staff_JSP/add-prescription.jsp").forward(request, response);
        } catch (Exception e) {
            log("Error retrieving medical record: " + e.getMessage());
            request.setAttribute("errorMessage", "Unable to retrieve medical record. Please try again.");
            request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int recordID = Integer.parseInt(request.getParameter("recordID"));
            String[] medicineIDs = request.getParameterValues("medicineIds");
            int staffID = Integer.parseInt(request.getParameter("staffID"));
            String dosage = request.getParameter("dosage");
            String frequency = request.getParameter("frequency");
            String duration = request.getParameter("duration");

            // Validate input
            if (dosage == null || frequency == null || duration == null || medicineIDs == null || medicineIDs.length == 0) {
                request.setAttribute("errorMessage", "Invalid input. Please check your data.");
                request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
                return;
            }

            // Process each selected medicine
            for (String medicineID_raw : medicineIDs) {
                int medicineID = Integer.parseInt(medicineID_raw);

                // Check for existing prescription
                if (prescriptionDAO.existsPrescription(recordID, medicineID, dosage, frequency, duration)) {
                    request.setAttribute("errorMessage", "A prescription already exists for this medicine. Please change the medicine.");
                    request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
                    return;
                }

                // Create prescription object and add to the database
                Prescription prescription = new Prescription(recordID, medicineID, dosage, frequency, duration);
                prescriptionDAO.addPrescription(prescription);
            }

            // Redirect to the prescription list after successful addition
            response.sendRedirect("listprescription");
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid ID format. Please check your data.");
            request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
        } catch (Exception e) {
            log("Unexpected error: " + e.getMessage());
            request.setAttribute("errorMessage", "An unexpected error occurred.");
            request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for adding prescriptions";
    }
}
