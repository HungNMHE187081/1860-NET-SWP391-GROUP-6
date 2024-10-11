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
import java.sql.SQLException;
import model.District;

/**
 *
 * @author LENOVO
 */
public class AddDistrictServlet extends HttpServlet {

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
            out.println("<title>Servlet AddDistrict</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddDistrict at " + request.getContextPath() + "</h1>");
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
        
    ManagerDAO dao = new ManagerDAO();
    int provinceID = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("districtName");
    
    try {
        // Kiểm tra xem tên quận/huyện đã tồn tại chưa
        if (dao.isDistrictNameExist(provinceID, name)) {
            // Quận/huyện đã tồn tại, xử lý trường hợp này (ví dụ thông báo lỗi)
            request.setAttribute("errorMessage", "Tên quận/huyện đã tồn tại!");
            request.getRequestDispatcher("managedistrict?id=" + provinceID).forward(request, response);
        } else {
            // Nếu chưa tồn tại, tiếp tục thêm mới quận/huyện
            District district = new District();
            district.setDistrictName(name);
            district.setProvinceID(provinceID);
            dao.addDistricts(district);
            response.sendRedirect("managedistrict?id=" + provinceID); // Chuyển hướng sau khi thêm thành công
        }
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp"); // Chuyển hướng khi có lỗi
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
