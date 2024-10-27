package controller;

import dal.StaffDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MedicalRecord;
import model.MedicalRecordDAO;
import model.Staff;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class EditMedicalRecord extends HttpServlet {

    private MedicalRecordDAO medicalRecordDAO;

    @Override
    public void init() throws ServletException {
        // Initialize DAO in the init method
        medicalRecordDAO = new MedicalRecordDAO(/* Pass database connection if needed */);
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String recordIdParam = request.getParameter("id");
            int recordID = Integer.parseInt(recordIdParam);

            // Retrieve the medical record by ID
            MedicalRecord record = medicalRecordDAO.getMedicalRecordByID(recordID);

            StaffDAO staffDAO = new StaffDAO();
            Staff staff = staffDAO.getStaffByID(record.getStaffID());

            // Set attributes for JSP
            request.setAttribute("record", record);
            request.setAttribute("staff", staff);

            // Forward to update page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Staff_JSP/update-medical-record.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     */
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        // Extracting parameters from the request
        int recordID = Integer.parseInt(request.getParameter("id"));
        String diagnosis = request.getParameter("diagnosis");
        String treatment = request.getParameter("treatment");
        String notes = request.getParameter("notes");


        // Create and populate MedicalRecord object
        MedicalRecord record = new MedicalRecord();
        record.setRecordID(recordID);
        record.setDiagnosis(diagnosis);
        record.setTreatment(treatment);
        record.setNotes(notes);

        // Update the medical record
        boolean isUpdated = medicalRecordDAO.updateMedicalRecord(record);

        if (isUpdated) {
            response.sendRedirect("medicalrecordlist"); // Redirect if successful
        } else {
            request.setAttribute("errorMessage", "Failed to update record.");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    } catch (NumberFormatException e) {
        e.printStackTrace(); // For debugging
        request.setAttribute("errorMessage", "Invalid input format.");
        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
    } catch (Exception e) {
        e.printStackTrace(); // For unexpected errors
        request.setAttribute("errorMessage", "An error occurred.");
        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
    }
}


    /**
     * Converts a date string to java.sql.Date.
     */
  private Date convertToSqlDate(String dateStr) throws ParseException {
    if (dateStr == null || dateStr.trim().isEmpty()) {
        throw new ParseException("Date string is empty or null", 0);
    }

    // Ensure the date format matches "yyyy-MM-dd"
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    format.setLenient(false);  // Strict date parsing
    java.util.Date utilDate = format.parse(dateStr);

    // Convert to java.sql.Date
    return new Date(utilDate.getTime());
}

    @Override
    public String getServletInfo() {
        return "Edit Medical Record Servlet";
    }

    public static void main(String[] args) {
        MedicalRecordDAO dao = new MedicalRecordDAO();
        MedicalRecord test = dao.getMedicalRecordByID(6);
        System.out.println(test);
    }
}
