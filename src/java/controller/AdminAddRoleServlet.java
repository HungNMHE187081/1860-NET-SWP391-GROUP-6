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
 import java.util.List;
 import model.Roles;
 import model.Users;
 
 /**
  *
  * @author HÙNG
  */
 public class AdminAddRoleServlet extends HttpServlet {
    
     private UserDAO userDAO;
     private RolesDAO rolesDAO;
 
     @Override
     public void init() {
         userDAO = new UserDAO();
         rolesDAO = new RolesDAO();
     }
 
     @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException {
         int userId = Integer.parseInt(request.getParameter("userId"));
         List<Roles> allRoles = rolesDAO.getAllRoles();
         request.setAttribute("userId", userId);
         request.setAttribute("allRoles", allRoles);
         request.getRequestDispatcher("/Admin_JSP/admin-add-role.jsp").forward(request, response);
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
         int userId = Integer.parseInt(request.getParameter("userId"));
         int roleId = Integer.parseInt(request.getParameter("roleId"));
         
         // Check if user is already have role or not
         Users user = userDAO.getUserById(userId);
         if (user.getRoles().isEmpty()) {
             userDAO.addUserRole(userId, roleId);
             response.sendRedirect(request.getContextPath() + "/admin/adminuserslist");
         } else {
             // display error if user haven't assign role
             request.setAttribute("errorMessage", "User already has a role.");
             doGet(request, response);
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