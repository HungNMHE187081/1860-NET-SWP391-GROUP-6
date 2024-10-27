/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.MedicineDAO;
import dal.PrescriptionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Medicine;
import model.Prescription;
import model.MedicalRecordDAO;
import model.MedicalRecord;
/**
 *
 * @author User
 */
public class EditPrescription extends HttpServlet {
   
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
            out.println("<title>Servlet EditPrescription</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPrescription at " + request.getContextPath () + "</h1>");
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
    try {
        String id_raw = request.getParameter("id");
        if (id_raw == null || !id_raw.matches("\\d+")) {
            request.setAttribute("error", "Invalid prescription ID.");
            request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
            return;
        }
        
        int id = Integer.parseInt(id_raw);
        PrescriptionDAO dao = new PrescriptionDAO();
        Prescription pre = dao.getPrescriptionById(id);
        
        if (pre == null) {
            request.setAttribute("error", "Prescription not found.");
            request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
            return;
        }

        MedicineDAO mDAO = new MedicineDAO();
        List<Medicine> medicineList = mDAO.getAllMedicines();
         MedicalRecordDAO meDAO = new MedicalRecordDAO();
            MedicalRecord medicalRecord = meDAO.getMedicalRecordByID(pre.getRecordID());
        request.setAttribute("medicalRecord", medicalRecord);
        request.setAttribute("medicineList", medicineList);
        request.setAttribute("pres", pre);
        request.getRequestDispatcher("/Staff_JSP/edit-prescription.jsp").forward(request, response);
    } catch (Exception e) {
        request.setAttribute("error", "An error occurred while fetching the prescription.");
        request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
        e.printStackTrace();
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
