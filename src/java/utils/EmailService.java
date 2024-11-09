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

public class EmailService {
    private static final String HOST = "smtp.gmail.com";
    private static final int PORT = 587;
    private static final String USERNAME = "hunghbhe187115@fpt.edu.vn"; // Replace with your email
    private static final String APP_PASSWORD = "ngpx dkpz lqio beqv"; // Replace with your App Password

    public static void sendEmail(String recipientEmail, String firstName, String middleName, String lastName, String username, String password) throws MessagingException {
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
            message.setSubject("Welcome to Medicine Shop");

            String fullName = firstName + " " + (middleName != null ? middleName + " " : "") + lastName;
            String emailContent = generateHtmlContent(fullName, username, password);
            message.setContent(emailContent, "text/html; charset=UTF-8");

            Transport.send(message);
        } catch (MessagingException e) {
            throw new MessagingException("Unable to send email: " + e.getMessage(), e);
        }
    }

    private static String generateHtmlContent(String fullName, String username, String password) {
        return "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <title>Chào mừng đến với ChildCare</title>\n"
                + "</head>\n"
                + "<body style=\"font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0;\">\n"
                + "    <table style=\"width: 100%; max-width: 600px; margin: 20px auto; background-color: #ffffff; border-collapse: collapse;\">\n"
                + "        <tr>\n"
                + "            <td style=\"padding: 20px; text-align: center; background-color: #3d5ee9; color: #ffffff; font-size: 24px;\">\n"
                + "                Chào mừng đến với ChildCare!\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "        <tr>\n"
                + "            <td style=\"padding: 20px;\">\n"
                + "                <p>Gửi " + fullName + ",</p>\n"
                + "                <p>Chúng tôi rất vui mừng được chào đón bạn đến với trang của chúng tôi! Dưới đây là thông tin đăng nhập của bạn:</p>\n"
                + "                <p><strong>Tên đăng nhập:</strong> " + username + "</p>\n"
                + "                <p><strong>Mật khẩu:</strong> " + password + "</p>\n"
                + "                <p>Bạn có thể truy cập cổng thông tin khách hàng bằng cách nhấp vào liên kết bên dưới:</p>\n"
                + "                <p><a href=\"http://localhost:9999/G6_ChildrenCare/login\" style=\"color: #3d5ee9; text-decoration: none; font-weight: bold;\">ChildCare</a></p>\n"
                + "                <p>Chúng tôi mong muốn nhận được sự ủng hộ của bạn cho dịch vụ của chúng tôi</p>\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "        <tr>\n"
                + "            <td style=\"padding: 20px; text-align: center; background-color: #3d5ee9; color: #ffffff;\">\n"
                + "                &copy; 2024 ChildCare\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "    </table>\n"
                + "</body>\n"
                + "</html>";
    }
}
