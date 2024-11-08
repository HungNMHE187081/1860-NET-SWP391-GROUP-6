/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.PrescriptionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.MedicalRecord;
import model.MedicalRecordDAO;
import model.Prescription;
import model.Users;

/**
 *
 * @author User
 */
public class CustomerPrescription extends HttpServlet {
   
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
            out.println("<title>Servlet CustomerPrescription</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerPrescription at " + request.getContextPath () + "</h1>");
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
    HttpSession session = request.getSession();
    Users user = (session != null) ? (Users) session.getAttribute("user") : null;

    if (user != null) {
        try {
            PrescriptionDAO dao = new PrescriptionDAO();
            MedicalRecordDAO mDAO = new MedicalRecordDAO();

            // Retrieve the search parameter from the request
            String search = request.getParameter("search");
            if (search == null) search = "";  // Default to empty if no search query is provided

            // Retrieve the list of prescriptions based on the search input
            List<Prescription> listPre = dao.getAllPrescriptions(search);

            // Tạo Map để nhóm các Prescription theo recordID
            Map<Integer, List<Prescription>> groupedPrescriptions = new HashMap<>();
            for (Prescription pre : listPre) {
                groupedPrescriptions.computeIfAbsent(pre.getRecordID(), k -> new ArrayList<>()).add(pre);
            }

            // Lấy thông tin MedicalRecord cho từng recordID
            Map<Integer, MedicalRecord> medicalRecords = new HashMap<>();
            for (Integer recordID : groupedPrescriptions.keySet()) {
                MedicalRecord medicalRecord = mDAO.getMedicalRecordByID(recordID);
                if (medicalRecord != null) {
                    medicalRecords.put(recordID, medicalRecord);
                }
            }

            // Set the grouped list and medical records as request attributes
            request.setAttribute("user", user);
            request.setAttribute("groupedPrescriptions", groupedPrescriptions);
            request.setAttribute("medicalRecords", medicalRecords); // Thêm medicalRecords vào thuộc tính request
            request.getRequestDispatcher("/Common_JSP/customer-prescription-list.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
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
