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
private boolean isEmptyOrSpaces(String input) {
    return input == null || input.trim().isEmpty();
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
    try {
        // Get the parameters
        String prescriptionIdRaw = request.getParameter("id");
        String medicineIdRaw = request.getParameter("medicineId");

        // Check if the parameters are not null or empty
        if (prescriptionIdRaw == null || prescriptionIdRaw.isEmpty() || medicineIdRaw == null || medicineIdRaw.isEmpty()) {
            request.setAttribute("errorMessage", "Prescription ID or Medicine ID is missing.");
            request.getRequestDispatcher("edit-prescription.jsp").forward(request, response);
            return; // Stop further processing
        }

        // Parse the parameters
        int prescriptionID = Integer.parseInt(prescriptionIdRaw);
        int medicineID = Integer.parseInt(medicineIdRaw);
        String dosage = request.getParameter("dosage");
        String frequency = request.getParameter("frequency");
        String duration = request.getParameter("duration");
 if (isEmptyOrSpaces(dosage) || isEmptyOrSpaces(frequency) || isEmptyOrSpaces(duration)) {
                // Chuyển hướng đến trang lỗi nếu phát hiện trường chỉ chứa dấu cách
                request.setAttribute("errorMessage", "Các trường nhập liệu không được để trống hoặc chỉ chứa khoảng trắng.");
                request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
                return;
            }
        // Proceed with updating the prescription
        PrescriptionDAO prescriptionDAO = new PrescriptionDAO();
        boolean isUpdated = prescriptionDAO.updatePrescription(prescriptionID, medicineID, dosage, frequency, duration);

        if (isUpdated) {
            response.sendRedirect("listprescription"); // Redirect to the prescription list after successful update
        } else {
            request.setAttribute("errorMessage", "Thông tin thuốc đã tồn tại.");
            request.getRequestDispatcher("/Staff_JSP/error.jsp?id=" + prescriptionID).forward(request, response);
        }
    } catch (NumberFormatException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Invalid prescription ID or medicine ID.");
        request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "An error occurred while updating prescription.");
        request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
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
