/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ManagerUserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.District;
import model.Provinces;
import model.UserAddresses;
import model.UserAuthentication;
import model.Users;
import model.Ward;

/**
 *
 * @author LENOVO
 */
public class AddUserServlet extends HttpServlet {

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
            out.println("<title>Servlet AddUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUserServlet at " + request.getContextPath() + "</h1>");
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
        ManagerUserDAO userDAO = new ManagerUserDAO();
        List<Provinces> provinces = userDAO.getAllProvinces();
        List<District> districts = userDAO.getDistrictsByProvince(provinces.get(0).getProvinceID()); // Lấy districts của province đầu tiên
        List<Ward> wards = userDAO.getWardsByDistrict(districts.get(0).getId()); // Lấy wards của district đầu tiên

        // Thiết lập các biến trong request
        request.setAttribute("provinces", provinces);
        request.setAttribute("districts", districts);
        request.setAttribute("wards", wards);

        // Chuyển tiếp đến trang form-add-user.jsp
        request.getRequestDispatcher("form-add-user.jsp").forward(request, response);
   
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
        Users user = new Users();
        user.setFirstName(request.getParameter("firstName"));
        user.setMiddleName(request.getParameter("middleName"));
        user.setLastName(request.getParameter("lastName"));
        user.setEmail(request.getParameter("email"));
        user.setPhoneNumber(request.getParameter("phoneNumber"));
        user.setDateOfBirth(java.sql.Date.valueOf(request.getParameter("dateOfBirth")));
        user.setGender(request.getParameter("gender"));
        user.setCitizenIdentification(request.getParameter("citizenIdentification"));
        user.setProfileImage(request.getParameter("profileImage"));

        // Thêm địa chỉ
        UserAddresses address = new UserAddresses();
        address.setStreetAddress(request.getParameter("streetAddress"));
        address.setWardID(Integer.parseInt(request.getParameter("wardID")));
        user.setAddress(address);

        // Thêm thông tin đăng nhập
        UserAuthentication userAuth = new UserAuthentication();
        userAuth.setUsername(request.getParameter("username"));
        userAuth.setPasswordHash(request.getParameter("passwordHash"));
        user.setUser(userAuth);

        // Gọi phương thức addUser trong UserDAO
        ManagerUserDAO userDAO = new ManagerUserDAO();
        userDAO.addUser(user);

        // Chuyển hướng đến trang thành công hoặc trang khác
        response.sendRedirect("success.jsp");
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
