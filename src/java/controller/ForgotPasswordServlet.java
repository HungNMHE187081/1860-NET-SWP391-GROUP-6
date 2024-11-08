package controller;

import dal.UserDAO;
import model.Users;
import utils.EmailUtil;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.mail.MessagingException;
import java.util.logging.Logger;
import java.util.logging.Level;

public class ForgotPasswordServlet extends HttpServlet {
    private UserDAO userDAO;
    private static final Logger LOGGER = Logger.getLogger(ForgotPasswordServlet.class.getName());
    
    @Override
    public void init() {
        userDAO = new UserDAO();
        System.out.println("ForgotPasswordServlet initialized");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("ForgotPasswordServlet - doGet called");
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        LOGGER.log(Level.INFO, "ForgotPasswordServlet - doPost started");
        String email = request.getParameter("email");
        LOGGER.log(Level.INFO, "Email received: {0}", email);
        
        try {
            // Tìm user theo email
            Users user = userDAO.findUserByEmail(email);
            System.out.println("User found: " + (user != null ? "yes" : "no"));
            
            if (user != null) {
                // Tạo mã xác nhận
                String verificationCode = userDAO.generateVerificationCode();
                System.out.println("Generated verification code: " + verificationCode);
                
                // Lưu mã xác nhận vào database
                boolean isCreated = userDAO.createPasswordReset(user.getUserID(), verificationCode);
                System.out.println("Password reset created: " + isCreated);
                
                if (isCreated) {
                    // Tạo link reset password
                    String resetLink = request.getScheme() + "://" + 
                                    request.getServerName() + ":" + 
                                    request.getServerPort() + 
                                    request.getContextPath() + 
                                    "/resetpassword?code=" + verificationCode;
                    
                    System.out.println("Reset link generated: " + resetLink);
                    
                    String emailContent = String.format(
                        "Xin chào,<br><br>" +
                        "Chúng tôi nhận được yêu cầu đặt lại mật khẩu của bạn.<br>" +
                        "Vui lòng click vào link sau để đặt lại mật khẩu:<br><br>" +
                        "<a href='%s'>Đặt lại mật khẩu</a><br><br>" +
                        "Link này sẽ hết hạn sau 24 giờ.<br><br>" +
                        "Nếu bạn không yêu cầu đặt lại mật khẩu, vui lòng bỏ qua email này.",
                        resetLink
                    );
                    
                    System.out.println("Attempting to send email...");
                    EmailUtil.sendEmail(email, "Đặt lại mật khẩu", emailContent);
                    System.out.println("Email sent successfully");
                    
                    String message = java.net.URLEncoder.encode("Vui lòng kiểm tra email của bạn để đặt lại mật khẩu", "UTF-8");
                    response.sendRedirect("forgot-password.jsp?message=" + message);
                } else {
                    String error = java.net.URLEncoder.encode("Có lỗi xảy ra. Vui lòng thử lại sau", "UTF-8");
                    response.sendRedirect("forgot-password.jsp?error=" + error);
                }
            } else {
                String error = java.net.URLEncoder.encode("Email không tồn tại trong hệ thống", "UTF-8");
                response.sendRedirect("forgot-password.jsp?error=" + error);
            }
            
        } catch (MessagingException e) {
            String error = java.net.URLEncoder.encode("Không thể gửi email. Vui lòng thử lại sau", "UTF-8");
            response.sendRedirect("forgot-password.jsp?error=" + error);
        }
    }
}