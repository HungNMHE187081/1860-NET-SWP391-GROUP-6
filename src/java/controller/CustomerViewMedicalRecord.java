/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import java.io.PrintWriter;

/**
 *
 * @author User
 */
public class CustomerViewMedicalRecord extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerViewMedicalRecord</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerViewMedicalRecord at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String recordID_raw = request.getParameter("recordID"); // Thay đổi để lấy "recordID"

        try {
            // Validate the input parameter
            if (recordID_raw == null || recordID_raw.isEmpty()) {
                request.setAttribute("errorMessage", "Invalid record ID.");

                return; // Stop further processing
            }

            // Parse recordID from the request parameter
            int recordID = Integer.parseInt(recordID_raw);

            // Retrieve the medical record
            MedicalRecordDAO dao = new MedicalRecordDAO();
            MedicalRecord medicalRecord = dao.getMedicalRecordByID(recordID);
            ReservationDAO rDAO = new ReservationDAO();
            String serviceName = rDAO.getServiceNameByReservationID(medicalRecord.getReservationID());
            // Check if the medical record exists
            if (medicalRecord == null) {
                request.setAttribute("errorMessage", "Medical record not found.");

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
            request.getRequestDispatcher("/Common_JSP/customer-view-medical-record.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Record ID must be a valid number.");

        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
