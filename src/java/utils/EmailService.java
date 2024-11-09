/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

/**
 *
 * @author LENOVO
 */
public class EmailService {
    private static final String HOST = "smtp.gmail.com";
    private static final int PORT = 587;
    private static final String USERNAME = "hunghbhe187115@fpt.edu.vn"; // Thay bằng email của bạn
    private static final String APP_PASSWORD = "ngpx dkpz lqio beqv"; // Thay bằng App Password

    public static void sendEmail(String recipientEmail, String username, String password) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.port", PORT);
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", HOST);

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USERNAME, APP_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Thông tin tài khoản đăng nhập");
            
            String emailContent = String.format("""
                Chào bạn,
                
                Thông tin tài khoản của bạn:
                Tên đăng nhập: %s
                Mật khẩu: %s
                
                Vui lòng đăng nhập và thay đổi mật khẩu để bảo mật tài khoản.
                
                Trân trọng!
                """, username, password);
            
            message.setText(emailContent);
            Transport.send(message);
        } catch (MessagingException e) {
            throw new MessagingException("Không thể gửi email: " + e.getMessage(), e);
        }
    }
}