package com.sgm.notification;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailNotificationUtil {

    // Replace with your actual email server configuration
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    private static final String SENDER_EMAIL = "adiitya7476007@gmail.com";
    private static final String SENDER_PASSWORD = "";//Sender mail password

    public static void sendBidAcceptanceEmail(String recipientEmail,String tid) {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        	Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Bid Acceptance Notification");
            message.setText("Dear "+recipientEmail+",\n\nYour bid for tendor with Tendor Id : "+tid+" has been accepted by the admin.\n\nRegards,\nBig-Bid Tenders");

            Transport.send(message);

            // Log success or handle as needed
            System.out.println("Bid acceptance email sent successfully!");
        } catch (MessagingException e) {
            e.printStackTrace();
            // Log or handle the exception
        }
    }
    
    

}
