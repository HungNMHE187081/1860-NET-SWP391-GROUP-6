package utils;

import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtil {
    private static final String FROM_EMAIL = "vuviet.test@gmail.com";
    private static final String PASSWORD = "jsvotrlguqrbmnwp";
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    
    /**
     * Sends a confirmation email to the specified recipient
     * @param toEmail recipient's email address
     * @param userName recipient's name
     * @throws MessagingException if there's an error sending the email
     */
public static void sendConfirmationEmail(String toEmail, String userName) throws MessagingException {
    // Kiểm tra đầu vào
    if (toEmail == null || toEmail.trim().isEmpty()) {
        throw new IllegalArgumentException("Địa chỉ email không được để trống");
    }
    if (userName == null || userName.trim().isEmpty()) {
        throw new IllegalArgumentException("Tên người dùng không được để trống");
    }
    
    Session session = createMailSession();
    
    try {
        // Tạo tin nhắn
        MimeMessage msg = new MimeMessage(session);
        msg.setHeader("Content-Type", "text/html; charset=UTF-8");
        msg.setFrom(new InternetAddress(FROM_EMAIL, "Hệ thống Chăm sóc Trẻ em", "UTF-8"));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
        msg.setSubject("Xác nhận Phản hồi", "UTF-8");
        msg.setSentDate(new Date());
        
        // Tạo nội dung HTML
        String htmlContent = String.format(
            "<html>" +
            "<body style='font-family: Arial, sans-serif;'>" +
                "<div style='padding: 20px; max-width: 600px; margin: 0 auto;'>" +
                    "<h2 style='color: #2c3e50;'>Xác nhận Phản hồi</h2>" +
                    "<p>Thân gửi <strong>%s</strong>,</p>" +
                    "<p>Cảm ơn bạn đã gửi phản hồi. Chúng tôi đã nhận được phản hồi của bạn " +
                    "và sẽ xem xét trong thời gian sớm nhất.</p>" +
                    "<p>Nếu bạn có bất kỳ câu hỏi nào, xin đừng ngần ngại liên hệ với chúng tôi.</p>" +
                    "<br>" +
                    "<p>Trân trọng,<br>Đội ngũ Hỗ trợ</p>" +
                "</div>" +
            "</body>" +
            "</html>",
            userName
        );
        
        // Đặt nội dung tin nhắn
        msg.setContent(htmlContent, "text/html; charset=UTF-8");
        
        // Gửi tin nhắn
        Transport.send(msg);
        
    } catch (MessagingException e) {
        throw new MessagingException("Gửi email thất bại: " + e.getMessage(), e);
    } catch (Exception e) {
        throw new RuntimeException("Lỗi không mong muốn khi gửi email: " + e.getMessage(), e);
    }
}
    
    /**
     * Creates and configures the mail session with SMTP settings
     * @return configured Session object
     */
    private static Session createMailSession() {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", SMTP_HOST);
        
        return Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        });
    }
}