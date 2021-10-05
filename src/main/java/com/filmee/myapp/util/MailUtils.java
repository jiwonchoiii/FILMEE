package com.filmee.myapp.util;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailUtils {

	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;

	public MailUtils(JavaMailSender mailSender) throws MessagingException {
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}//constructor

	public void setSubject(String subject) throws MessagingException {
		messageHelper.setSubject(subject);
	}//setSubject

	public void setText(String htmlContent) throws MessagingException {
		messageHelper.setText(htmlContent, true);
	}//setText

	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
		messageHelper.setFrom(email, name);
	}//setFrom

	public void setTo(String email) throws MessagingException {
		messageHelper.setTo(email);
	}//setTo

	public void addInline(String contentId, DataSource dataSource) throws MessagingException {
		messageHelper.addInline(contentId, dataSource);
	}//addInline

	public void send() {
		mailSender.send(message);
	}//send
	
}//end class