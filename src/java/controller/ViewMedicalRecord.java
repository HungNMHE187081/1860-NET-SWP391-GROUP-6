/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.MedicineDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MedicalRecordDAO;
import dal.StaffDAO;
import model.MedicalRecord;
import model.Staff;

/**
 *
 * @author User
 */
public class ViewMedicalRecord extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ViewMedicalRecord</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewMedicalRecord at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override

protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String recordID_raw = request.getParameter("id");

    try {
        // Validate the input parameter
        if (recordID_raw == null || recordID_raw.isEmpty()) {
            throw new IllegalArgumentException("Invalid record ID.");
        }

        // Parse recordID from the request parameter
        int recordID = Integer.parseInt(recordID_raw);

        // Retrieve the medical record
        MedicalRecordDAO dao = new MedicalRecordDAO();
        MedicalRecord medicalRecord = dao.getMedicalRecordByID(recordID);

        // Check if the medical record exists
        if (medicalRecord == null) {
            request.setAttribute("errorMessage", "Medical record not found.");
            request.getRequestDispatcher("/Staff_JSP/error-page.jsp").forward(request, response);
            return; // Stop further processing
        }

        // Retrieve the associated staff
        StaffDAO staffDAO = new StaffDAO();
        Staff staff = staffDAO.getStaffByID(medicalRecord.getStaffID());

        // Set attributes for JSP
        request.setAttribute("staff", staff);
        request.setAttribute("medicalRecord", medicalRecord);

        // Forward to the view page
        request.getRequestDispatcher("/Staff_JSP/view-medical-record.jsp").forward(request, response);

    } catch (NumberFormatException e) {
        System.out.println(e);
    } 
}

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
