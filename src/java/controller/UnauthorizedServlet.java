package controller;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;
import java.util.List;

public class UnauthorizedServlet extends HttpServlet {
    private UserDAO userDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            List<String> roles = userDAO.getUserRoles(user.getUserID());
            request.setAttribute("userRoles", roles);
        }
        request.setAttribute("userDAO", userDAO);
        request.getRequestDispatcher("/unauthorized.jsp").forward(request, response);
    }
}