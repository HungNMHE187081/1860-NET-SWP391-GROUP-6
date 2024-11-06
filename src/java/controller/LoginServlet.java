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
        System.out.println("=== LoginServlet initialized ===");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("=== LoginServlet doGet START ===");
        HttpSession session = request.getSession();
        Users currentUser = (Users) session.getAttribute("user");
        System.out.println("Current user in session: " + (currentUser != null ? currentUser.getUserID() : "null"));
        
        request.getRequestDispatcher("/login.jsp").forward(request, response);
        System.out.println("=== LoginServlet doGet END ===");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("=== LoginServlet doPost START ===");
        String username = request.getParameter("username");
        System.out.println("Login attempt for username: " + username);

        try {
            UserAuthentication userAuth = userDAO.loginUser(username, request.getParameter("password"));
            if (userAuth != null) {
                System.out.println("Authentication successful for UserID: " + userAuth.getUserID());
                
                Users user = userDAO.getUserWithAddressById(userAuth.getUserID());
                System.out.println("Retrieved user details: " + user.getUserID());

                HttpSession session = request.getSession(true);
                session.setAttribute("user", user);
                System.out.println("User set in session with ID: " + user.getUserID());

                // Kiểm tra role và redirect phù hợp
                List<String> roles = userDAO.getUserRoles(user.getUserID());
                System.out.println("User roles: " + String.join(", ", roles));

                String redirectPath = "";
                if (roles.contains("Administrator")) {
                    redirectPath = "/admin/adminuserslist";
                } else if (roles.contains("Manager")) {
                    redirectPath = "/manager/serviceslist";
                } else if (roles.contains("Staff")) {
                    redirectPath = "/staff/staffhomepage";
                } else {
                    redirectPath = "/customer/homepage";
                }

                System.out.println("Redirecting to: " + redirectPath);
                response.sendRedirect(request.getContextPath() + redirectPath);
                
                // Kiểm tra lại session sau khi set
                Users sessionUser = (Users) session.getAttribute("user");
                System.out.println("Verified user in session: " + 
                    (sessionUser != null ? sessionUser.getUserID() : "null"));
                
            } else {
                System.out.println("Login failed for username: " + username);
                response.sendRedirect("login.jsp?error=Invalid username or password");
            }
        } catch (Exception e) {
            System.out.println("Error in LoginServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=System error occurred");
        }
        
        System.out.println("=== LoginServlet doPost END ===");
    }
}
