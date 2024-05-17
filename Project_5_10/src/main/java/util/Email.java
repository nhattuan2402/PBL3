package util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.activation.DataHandler;
import javax.activation.DataSource;
public class Email {
	// Email: phanvantoan.contact@gmail.com
	// Password: sewu piwq aywc afbb
	
	public static void main(String[] args) {
		final String from = "phanvantoan.contact@gmail.com";
		final String password = "sewu piwq aywc afbb";
		
		// Properties
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
		props.put("mail.smtp.port", "smtp.gmail.com"); // TLS Port 587, SSL Port 465
		props.put("mail.smtp.auth", "true"); // Enable Authentication
		props.put("mail.smtp.starttls.enable", "true"); // Enable StartTLS
		
		// Create Authenticator
		Authenticator auth = new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(from, password);
			}
			
		};
		
		// Session
		Session session = Session.getInstance(props, auth);
		
		// Send Email
		final String to = "toanyogame@gmail.com";
		
		// Create MimeMessage
		MimeMessage msg = new MimeMessage(session);
		try {
			// Set Message
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			// Set From
			msg.setFrom(from);
			// Set To
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			// Set Subject
			msg.setSubject("Test Email");
			// Set Date Sent
			msg.setSentDate(new Date());
			// Set Reply To
			// msg.setReplyTo(InternetAddress.parse(from, false));
			// Set Message
			msg.setText("This is a test email", "UTF-8");
			// Send Email
			Transport.send(msg);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
