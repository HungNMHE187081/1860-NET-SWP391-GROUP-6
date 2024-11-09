package controller;

import dal.UserDAO;
import model.UserAuthentication;
import model.Users;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Roles;

public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");

        if (!password.equals(repassword)) {
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("error", "Mật khẩu không khớp!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        try {
            String salt = generateSalt();
            String passwordHash = hashPassword(password, salt);

            // Tạo đối tượng UserAuthentication
            UserAuthentication userAuth = new UserAuthentication();
            userAuth.setUsername(username);
            userAuth.setPasswordHash(passwordHash);
            userAuth.setSalt(salt);
            userAuth.setLastLogin(new Timestamp(System.currentTimeMillis()));

            // Tạo đối tượng Users
            Users user = new Users();
            user.setEmail(email);
            user.setUser(userAuth);

            // Khởi tạo danh sách roles rỗng cho user mới
            List<Roles> roles = new ArrayList<>();
            user.setRoles(roles);

            // Lưu thông tin người dùng vào cơ sở dữ liệu
            userDAO.registerUser(user);

            // Chuyển hướng đến trang login khi đăng ký thành công
            response.sendRedirect(request.getContextPath() + "/login");
            
        } catch (Exception e) {
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    private String generateSalt() {
        byte[] salt = new byte[16];
        new java.security.SecureRandom().nextBytes(salt);
        return Base64.getEncoder().encodeToString(salt);
    }

    private String hashPassword(String password, String salt) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(Base64.getDecoder().decode(salt));
            byte[] hashedPassword = md.digest(password.getBytes());
            return Base64.getEncoder().encodeToString(hashedPassword);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}