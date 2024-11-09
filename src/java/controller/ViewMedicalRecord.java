package controller;

import dal.MedicineDAO;
import dal.ReservationDAO;
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

public class ViewMedicalRecord extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String recordID_raw = request.getParameter("recordID"); // Thay đổi để lấy "recordID"

        try {
            // Validate the input parameter
            if (recordID_raw == null || recordID_raw.isEmpty()) {
                request.setAttribute("errorMessage", "Invalid record ID.");
                forwardToErrorPage(request, response);
                return; // Stop further processing
            }

            // Parse recordID from the request parameter
            int recordID = Integer.parseInt(recordID_raw);

            // Retrieve the medical record
            MedicalRecordDAO dao = new MedicalRecordDAO();
            ReservationDAO rDAO = new ReservationDAO();
            MedicalRecord medicalRecord = dao.getMedicalRecordByID(recordID);
            String serviceName = rDAO.getServiceNameByReservationID(medicalRecord.getReservationID());
            // Check if the medical record exists
            if (medicalRecord == null) {
                request.setAttribute("errorMessage", "Medical record not found.");
                forwardToErrorPage(request, response);
                return; // Stop further processing
            }

            // Retrieve the associated staff
            StaffDAO staffDAO = new StaffDAO();
            Staff staff = staffDAO.getStaffByID(medicalRecord.getStaffID());

            // Set attributes for JSP
            request.setAttribute("serviceName", serviceName);
            request.setAttribute("staff", staff);
            request.setAttribute("medicalRecord", medicalRecord);

            // Forward to the view page
            request.getRequestDispatcher("/Staff_JSP/view-medical-record.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Record ID must be a valid number.");
            forwardToErrorPage(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            forwardToErrorPage(request, response);
        }
    }

    private void forwardToErrorPage(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/Staff_JSP/error-page.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to view medical records.";
    }
}
