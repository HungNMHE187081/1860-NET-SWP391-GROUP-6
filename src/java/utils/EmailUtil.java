package utils;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtil {
//    private static final String FROM_EMAIL = "vuviet.test@gmail.com"; // Replace with your email
//    private static final String PASSWORD = "jsvotrlguqrbmnwp"; // Replace with your app password

    public static void main(String[] args) {
        final String from = "vuviet.test@gmail.com";
        final String password = "jsvotrlguqrbmnwp";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);

        // create Auth
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }

        };
        // Phiên làm việc
        Session session = Session.getInstance(props, auth);

        // gửi email
        final String to = "vuviett47@gmail.com";

        //Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);
        try {
            //Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            
            //Người gửi
            msg.setFrom(from);
            
            //Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            
            //Tiêu đề email
            msg.setSubject("Thử email");
            
            //Quy định ngày gửi
            msg.setSentDate(new Date());
            
            //Quy định email nhận phản hồi
            //msg.setReplyTo(InternetAddress.parse(from, false);
            
            //Nội dung
            msg.setText("Nội dung", "UTF-8");
            
            //Gửi email
            Transport.send(msg);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
