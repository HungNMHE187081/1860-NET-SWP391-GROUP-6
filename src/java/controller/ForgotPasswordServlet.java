package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Import các lớp cần thiết cho việc gửi email
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        // Kiểm tra email trong cơ sở dữ liệu
        boolean emailExists = checkEmailInDatabase(email);

        if (emailExists) {
            // Gửi email đặt lại mật khẩu
            boolean emailSent = sendResetPasswordEmail(email);

            if (emailSent) {
                response.sendRedirect(request.getContextPath() + "/forgot-password.jsp?message=Password reset link has been sent to your email");
            } else {
                response.sendRedirect(request.getContextPath() + "/forgot-password.jsp?message=Failed to send email. Please try again.");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/forgot-password.jsp?message=Email not found. Please try again.");
        }
    }

    private boolean checkEmailInDatabase(String email) {
        // Thực hiện logic kiểm tra email trong cơ sở dữ liệu
        // Trả về true nếu email tồn tại, ngược lại trả về false
        // Đây là ví dụ đơn giản, bạn cần triển khai logic thực tế để kiểm tra email
        return true; // Giả sử email tồn tại
    }

    private boolean sendResetPasswordEmail(String email) {
        // Cấu hình thông tin email
        final String username = "your-email@example.com";
        final String password = "your-email-password";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.example.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("your-email@example.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Reset Password");
            message.setText("Click the link below to reset your password:\n\n" +
                    "http://your-domain.com/reset-password?email=" + email);

            Transport.send(message);

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}