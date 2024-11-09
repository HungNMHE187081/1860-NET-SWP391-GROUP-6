/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ManagerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.District;
import java.sql.SQLException;
import java.util.List;
/**
 *
 * @author LENOVO
 */
public class EditDistrictsServlet extends HttpServlet {
   
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
            out.println("<title>Servlet EditDistricts</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditDistricts at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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
    
    int id = Integer.parseInt(request.getParameter("id")); // Lấy ID của quận/huyện đang được chỉnh sửa
    String name = request.getParameter("districtNameInput"); // Lấy tên quận/huyện mới từ form
    int provinceID = Integer.parseInt(request.getParameter("provinceID")); // Lấy ID tỉnh

    ManagerDAO dao = new ManagerDAO();
    
    try {
        // Kiểm tra tên quận/huyện có tồn tại hay không
        if (dao.isDistrictNameExist(provinceID, name) || name.trim().isEmpty()) {
            // Nếu tên đã tồn tại, gửi lại trang chỉnh sửa với thông báo lỗi
             List<District> district = dao.getAllDistricts(provinceID);
                request.setAttribute("district", district);
        request.setAttribute("errorMessage", "Tên quận/huyện đã tồn tại!"); // Thiết lập thông báo lỗi
        request.getRequestDispatcher("/Manager_JSP/Address/manager-DistrictWard-form.jsp").forward(request, response);
        } else {
            // Nếu không trùng lặp, tiến hành cập nhật
            dao.updateDistricts(id, name, provinceID);
            response.sendRedirect(request.getContextPath()+"/manager/managedistrict?id=" + provinceID); // Chuyển hướng sau khi thêm thành công
        }
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Đã xảy ra lỗi khi cập nhật!"); // Thiết lập thông báo lỗi khác
        request.getRequestDispatcher("manager-DistrictWard-form.jsp").forward(request, response);
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
