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
import model.MedicalRecord;
import model.MedicalRecordDAO;
import model.Medicine;
import model.Prescription;

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
            int id = Integer.parseInt(id_raw);
            PrescriptionDAO dao = new PrescriptionDAO();
            Prescription pre = dao.getPrescriptionById(id);
            MedicineDAO mDAO = new MedicineDAO();
            List<Medicine> medicineList = mDAO.getAllMedicines();
            MedicalRecordDAO meDAO = new MedicalRecordDAO();
            MedicalRecord medicalRecord = meDAO.getMedicalRecordByID(pre.getRecordID());

            request.setAttribute("medicalRecord", medicalRecord);
            request.setAttribute("medicineList", medicineList);
            request.setAttribute("pres", pre);
            request.getRequestDispatcher("/Staff_JSP/edit-prescription.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving prescription data");
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int prescriptionID = Integer.parseInt(request.getParameter("id")); // Correct name here
    int medicineID = Integer.parseInt(request.getParameter("medicineId")); // Correct name here
    String dosage = request.getParameter("dosage");
    String frequency = request.getParameter("frequency");
    String duration = request.getParameter("duration");

    try {
        PrescriptionDAO prescriptionDAO = new PrescriptionDAO();
        boolean isUpdated = prescriptionDAO.updatePrescription(prescriptionID, medicineID, dosage, frequency, duration);

        if (isUpdated) {
            response.sendRedirect("listprescription"); // Redirect to the prescription list after successful update
        } else {
            request.setAttribute("errorMessage", "Failed to update prescription.");
            request.getRequestDispatcher("edit-prescription.jsp?id=" + prescriptionID).forward(request, response);
        }
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "An error occurred while updating prescription.");
        request.getRequestDispatcher("edit-prescription.jsp?id=" + prescriptionID).forward(request, response);
    }
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
