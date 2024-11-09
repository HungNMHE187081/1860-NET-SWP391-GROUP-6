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
import java.util.ArrayList;

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
        
        // Lấy thông tin đăng nhập
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Tạo list để lưu các lỗi
        List<String> errors = new ArrayList<>();

        // 1. Validate username
        if (username == null || username.trim().isEmpty()) {
            errors.add("Vui lòng nhập tên đăng nhập");
        } else if (username.length() < 3 || username.length() > 50) {
            errors.add("Tên đăng nhập phải từ 3-50 ký tự");
        }

        // 2. Validate password
        if (password == null || password.trim().isEmpty()) {
            errors.add("Vui lòng nhập mật khẩu");
        }

        // Nếu có lỗi validate, trả về trang login với thông báo
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.setAttribute("username", username); // Giữ lại username đã nhập
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        try {
            HttpSession session = request.getSession();
            UserAuthentication userAuth = userDAO.loginUser(username, password);
            
            if (userAuth != null) {
                System.out.println("Authentication successful for UserID: " + userAuth.getUserID());
                
                Users user = userDAO.getUserWithAddressById(userAuth.getUserID());
                System.out.println("Retrieved user details: " + user.getUserID());

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
                
            } else {
                System.out.println("Login failed for username: " + username);
                errors.add("Tên đăng nhập hoặc mật khẩu không chính xác");
                request.setAttribute("errors", errors);
                request.setAttribute("username", username);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Error in LoginServlet: " + e.getMessage());
            e.printStackTrace();
            errors.add("Đã xảy ra lỗi hệ thống. Vui lòng thử lại sau");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
        
        System.out.println("=== LoginServlet doPost END ===");
    }
}
