/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ManagerDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import model.Provinces;

/**
 *
 * @author LENOVO
 */
public class ManagerAddressServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ViewDetailsUserServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewDetailsUserServlet at " + request.getContextPath () + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        ManagerDAO m = new ManagerDAO();
        List<Provinces> listP = m.getAllProvinces();
        request.setAttribute("listP", listP);
        request.getRequestDispatcher("/Manager_JSP/Address/manager-address.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");


    String provinceName = request.getParameter("name").trim();
    System.out.println("Tên tỉnh thành nhập vào: " + provinceName);
    ManagerDAO dao = new ManagerDAO();
    Provinces province = new Provinces();
    
    try {
        // Kiểm tra xem tên tỉnh thành có tồn tại không
        if (dao.isProvinceNameExist(provinceName)) {
            // Truyền thông báo lỗi về trang addProvince.jsp
            request.setAttribute("errorMessage", "Tên tỉnh thành đã tồn tại. Vui lòng chọn tên khác.");
            request.getRequestDispatcher("Manager_JSP/Address/manager-address.jsp").forward(request, response);
        } else {
            // Thêm tỉnh thành mới
            province.setProvinceName(provinceName);
            dao.addProvinces(province);
            response.sendRedirect(request.getContextPath()+"/manageraddress");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Có lỗi xảy ra, vui lòng thử lại sau.");
        request.getRequestDispatcher("/manageraddress").forward(request, response);
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
