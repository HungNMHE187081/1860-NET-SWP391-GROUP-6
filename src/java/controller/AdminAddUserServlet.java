/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.RolesDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.Users;

/**
 *
 * @author HÙNG
 */
public class AdminAddUserServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng đến trang admin-add-user.jsp
        request.getRequestDispatcher("/Admin_JSP/admin-add-user.jsp").forward(request, response);
    }
   
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String middleName = request.getParameter("middleName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        Date dateOfBirth = Date.valueOf(request.getParameter("dateOfBirth"));
        String gender = request.getParameter("gender");
        String citizenIdentification = request.getParameter("citizenIdentification");
        String role = request.getParameter("role");

        Users user = new Users();
        user.setFirstName(firstName);
        user.setMiddleName(middleName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setDateOfBirth(dateOfBirth);
        user.setGender(gender);
        user.setCitizenIdentification(citizenIdentification);

        UserDAO userDAO = new UserDAO();
        int userID = userDAO.addUser(user);

        RolesDAO rolesDAO = new RolesDAO();
        int roleID = rolesDAO.getRoleIDByName(role);
        userDAO.addUserRole(userID, roleID);

        response.sendRedirect(request.getContextPath() + "/admin/adminuserslist");
    }
}
