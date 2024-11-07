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
            msg.setFrom(new InternetAddress(FROM_EMAIL, "System Admin"));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            msg.setSubject("Feedback Confirmation");
            msg.setSentDate(new Date());
            
            // Create HTML content
            String htmlContent = String.format(
                "<html>" +
                "<body style='font-family: Arial, sans-serif;'>" +
                    "<div style='padding: 20px; max-width: 600px; margin: 0 auto;'>" +
                        "<h2 style='color: #2c3e50;'>Feedback Confirmation</h2>" +
                        "<p>Dear <strong>%s</strong>,</p>" +
                        "<p>Thank you for submitting your feedback. We have successfully received it " +
                        "and will review it shortly.</p>" +
                        "<p>If you have any questions, please don't hesitate to contact us.</p>" +
                        "<br>" +
                        "<p>Best regards,<br>The Support Team</p>" +
                    "</div>" +
                "</body>" +
                "</html>",
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