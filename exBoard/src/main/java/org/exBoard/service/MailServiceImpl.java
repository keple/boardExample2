package org.exBoard.service;

import java.io.File;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
	@Inject
	private JavaMailSender mailSender;
	@Override
	public boolean sendMailToUser(String title, String text, String from, String to, String filePath){
		MimeMessage message = mailSender.createMimeMessage();
		
		MimeMessageHelper helper;
		try {
			System.out.println("메일센더 inject?" + mailSender.toString());
			message.setHeader("contentType", "text/html");
			helper = new MimeMessageHelper(message,true,"UTF-8");
		
		
		helper.setSubject(title);
		helper.setText(text);
		helper.setFrom(new InternetAddress(from));
		helper.setTo(new InternetAddress(to));
		//null이면 실행안됨...
		if(filePath !=null){
			File file = new File(filePath);
			if(file.exists()){
				helper.addAttachment(file.getName(),new File(filePath));
			}
		}
			mailSender.send(message);
			System.out.println("success");
			return true;
		} catch (MessagingException e) {
			
			e.printStackTrace();
			
		}
		return false;
	}
	public JavaMailSender getMailSender() {
		return mailSender;
	}
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	@Override
	public String toString() {
		return "MailServiceImpl [mailSender=" + mailSender + "]";
	}

}
