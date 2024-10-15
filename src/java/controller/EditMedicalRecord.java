package controller;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MedicalRecord;

import java.io.IOException;
import model.MedicalRecordDAO;

/**
 *
 * @author User
 */
public class EditMedicalRecord extends HttpServlet {
    private MedicalRecordDAO medicalRecordDAO;

    @Override
    public void init() throws ServletException {
        // Khởi tạo DAO trong phương thức init
        medicalRecordDAO = new MedicalRecordDAO(/* Pass your database connection here */);
    }

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
    }

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
        String recordIdParam = request.getParameter("id");
        int recordID = Integer.parseInt(recordIdParam);

        // Lấy thông tin bản ghi từ cơ sở dữ liệu
        MedicalRecord record = medicalRecordDAO.getMedicalRecordByID(recordID); // Sửa tên phương thức cho đúng
        request.setAttribute("record", record);

        // Chuyển đến trang cập nhật
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Staff_JSP/update-medical-record.jsp");
        dispatcher.forward(request, response);
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
        int recordID = Integer.parseInt(request.getParameter("id")); // Lấy ID của bản ghi
        String diagnosis = request.getParameter("diagnosis");
        String treatment = request.getParameter("treatment");
        String notes = request.getParameter("notes");

        MedicalRecord record = new MedicalRecord();
        record.setRecordID(recordID);
        record.setDiagnosis(diagnosis);
        record.setTreatment(treatment);
        record.setNotes(notes);

        // Cập nhật bản ghi y tế
        boolean isUpdated = medicalRecordDAO.updateMedicalRecord(record);

        if (isUpdated) {
            response.sendRedirect("medicalrecordlist"); // Redirect đến trang danh sách
        } else {
            // Xử lý lỗi nếu không cập nhật thành công
            request.setAttribute("errorMessage", "Cập nhật không thành công.");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    public static void main(String[] args) {
        MedicalRecordDAO m = new MedicalRecordDAO();
        MedicalRecord test = new MedicalRecord();
        test = m.getMedicalRecordByID(6);
        System.out.println(test);
    }
}
