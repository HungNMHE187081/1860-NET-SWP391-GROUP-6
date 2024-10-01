package controller;

import dal.UserDAO;
import model.UserAuthentication;
import model.Users;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Base64;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng đến trang đăng ký
        response.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");

        if (!password.equals(repassword)) {
            response.sendRedirect("register.jsp?error=Passwords do not match");
            return;
        }

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
        user.setUser(userAuth); // Liên kết với UserAuthentication

        // Lưu thông tin người dùng vào cơ sở dữ liệu
        userDAO.registerUser(user);

        response.sendRedirect("login.jsp");
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