package controller;

import dal.UserDAO;
import model.UserAuthentication;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
            HttpSession session = request.getSession();
            session.setAttribute("user", userAuth);
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("login.jsp?error=Invalid username or password");
        }
    }
}