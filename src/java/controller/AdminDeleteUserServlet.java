/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/deleteUser")
public class AdminDeleteUserServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");
        if (userIdStr != null && !userIdStr.isEmpty()) {
            try {
                int userId = Integer.parseInt(userIdStr);
                boolean deleted = userDAO.deleteUser(userId);
                if (deleted) {
                    response.sendRedirect(request.getContextPath() + "/admin/adminsearchuser?message=User deleted successfully");
                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/adminsearchuser?error=Failed to delete user");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/admin/adminsearchuser?error=Invalid user ID");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/adminsearchuser?error=User ID is required");
        }
    }
}
