package utils;

import java.util.Date;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailUtil {

    private static final String FROM_EMAIL = "childrencare.test@gmail.com";
    private static final String PASSWORD = "mltn ufeq ljec oods";
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";

    /**
     * Sends a confirmation email to the specified recipient
     *
     * @param toEmail recipient's email address
     * @param userName recipient's name
     * @throws MessagingException if there's an error sending the email
     */
    public static void sendConfirmationEmail(String toEmail, String userName) throws MessagingException {
        // Input validation
        if (toEmail == null || toEmail.trim().isEmpty()) {
            throw new IllegalArgumentException("Email address cannot be empty");
        }
        if (userName == null || userName.trim().isEmpty()) {
            throw new IllegalArgumentException("Username cannot be empty");
        }

        Session session = createMailSession();

        try {
            // Create message
            MimeMessage msg = new MimeMessage(session);
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(new InternetAddress(FROM_EMAIL, MimeUtility.encodeText("Hỗ trợ ChildCare", "UTF-8", "B")));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            msg.setSubject("Xác nhận phản hồi");
            msg.setSentDate(new Date());

            // Create HTML content
            String htmlContent = String.format(
                    "<html>"
                    + "<body style='font-family: Arial, sans-serif;'>"
                    + "<div style='padding: 20px; max-width: 600px; margin: 0 auto;'>"
                    + "<h2 style='color: #2c3e50;'>Xác nhận phản hồi</h2>"
                    + "<p>Xin chào <strong>%s</strong>,</p>"
                    + "<p>Cảm ơn bạn đã gửi phản hồi cho chúng tôi. Chúng tôi đã nhận được phản hồi của bạn "
                    + "và sẽ xem xét trong thời gian sớm nhất.</p>"
                    + "<p>Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ với chúng tôi.</p>"
                    + "<br>"
                    + "<p>Trân trọng,<br>Đội ngũ Hỗ trợ</p>"
                    + "</div>"
                    + "</body>"
                    + "</html>",
                    userName
            );

            // Set message content
            msg.setContent(htmlContent, "text/html; charset=UTF-8");

            // Send message
            Transport.send(msg);

        } catch (MessagingException e) {
            throw new MessagingException("Failed to send email: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException("Unexpected error while sending email: " + e.getMessage(), e);
        }
    }

    public static void sendEmail(String toEmail, String subject, String content)
            throws MessagingException {
        Session session = createMailSession();

        try {
            MimeMessage msg = new MimeMessage(session);
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(new InternetAddress(FROM_EMAIL, "Children Care System"));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            msg.setSubject(subject, "UTF-8");
            msg.setSentDate(new Date());
            msg.setContent(content, "text/html; charset=UTF-8");

            Transport.send(msg);

        } catch (Exception e) {
            throw new MessagingException("Không thể gửi email: " + e.getMessage());
        }
    }

    /**
     * Creates and configures the mail session with SMTP settings
     *
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
