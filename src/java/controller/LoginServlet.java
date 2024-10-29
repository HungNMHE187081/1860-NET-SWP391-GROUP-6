package controller;

import dal.UserDAO;
import model.UserAuthentication;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Users;

public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserAuthentication userAuth = userDAO.loginUser(username, password);
        if (userAuth != null) {
            Users user = userDAO.getUserWithAddressById(userAuth.getUserID());
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Kiểm tra role và redirect phù hợp
            List<String> roles = userDAO.getUserRoles(user.getUserID());
            if (roles.contains("Administrator")) {
                response.sendRedirect(request.getContextPath() + "/admin/adminuserslist");
            } else if (roles.contains("Manager")) {
                response.sendRedirect(request.getContextPath() + "/manager/serviceslist");
            } else if (roles.contains("Staff")) {
                response.sendRedirect(request.getContextPath() + "/staff/staffhomepage");
            } else {
                response.sendRedirect(request.getContextPath() + "/homepage");
            }
        } else {
            response.sendRedirect("login.jsp?error=Invalid username or password");
        }
    }
}
