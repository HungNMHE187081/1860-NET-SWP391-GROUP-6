package controller;

import dal.UserDAO;
import jakarta.mail.MessagingException;
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
import utils.EmailUtil;

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

        // Tạo list để lưu các lỗi
        List<String> errors = new ArrayList<>();

        // 1. Validate username
        if (username == null || username.trim().isEmpty()) {
            errors.add("Tên đăng nhập không được để trống");
        } else if (username.length() < 3 || username.length() > 50) {
            errors.add("Tên đăng nhập phải từ 3-50 ký tự");
        } else if (!username.matches("^[a-zA-Z0-9_]+$")) {
            errors.add("Tên đăng nhập chỉ được chứa chữ cái, số và dấu gạch dưới");
        }

        // 2. Validate email
        if (email == null || email.trim().isEmpty()) {
            errors.add("Email không được để trống");
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            errors.add("Email không hợp lệ");
        } else {
            // Kiểm tra email đã tồn tại chưa
            try {
                if (userDAO.isEmailExists(email)) {
                    errors.add("Email này đã được đăng ký");
                }
            } catch (Exception e) {
                errors.add("Lỗi kiểm tra email: " + e.getMessage());
            }
        }

        // 3. Validate password
        if (password == null || password.trim().isEmpty()) {
            errors.add("Mật khẩu không được để trống");
        } else if (password.length() < 8) {
            errors.add("Mật khẩu phải có ít nhất 8 ký tự");
        } else if (!password.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$")) {
            errors.add("Mật khẩu phải chứa ít nhất 1 chữ hoa, 1 chữ thường, 1 số và 1 ký tự đặc biệt");
        }

        // 4. Validate repassword
        if (!password.equals(repassword)) {
            errors.add("Mật khẩu nhập lại không khớp");
        }

        // Nếu có lỗi, trả về trang register với thông báo lỗi
        if (!errors.isEmpty()) {
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("errors", errors);
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

            // Gửi email xác nhận
            try {
                EmailUtil.sendConfirmationEmail(email, username);
            } catch (MessagingException e) {
                // Log lỗi nhưng không dừng quá trình đăng ký
                e.printStackTrace();
            }

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