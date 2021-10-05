package com.filmee.myapp.service;

import java.io.UnsupportedEncodingException;
import java.util.Objects;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.filmee.myapp.util.MailUtils;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class MailSendServiceImpl 
	implements MailSendService, InitializingBean {

	@Setter(onMethod_=@Autowired)
	private JavaMailSenderImpl mailSender;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		log.debug("afterPropertiesSet() invoked.");
		
		Objects.requireNonNull(this.mailSender);
	}//afterPropertiesSet
		
	//인증코드 난수 생성
	@Override
	public String getRandomCode(int size) {
		log.debug("getRandomCode({}) invoked.", size);

		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;
		
		while(buffer.length() < size) {
			num = random.nextInt(10);	// 0~9사이의 난수 생성
			buffer.append(num);
		}//while
		
		String authCode = buffer.toString();
		log.info("authCode : {}", authCode);
		
		return authCode;
	}//getAuthCode

	//인증 메일 발송
	@Override
	public void sendAuthMail(String email, String authCode){
		log.debug("sendAuthMail({}) invoked.", email);
				
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("FilMEE 회원가입 이메일 인증");
			sendMail.setText(
					new StringBuffer()
							.append("<h1>[이메일 인증]</h1>")
							.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				            .append("<a href='http://localhost:8090/main/emailAuthorized?email=")
				            .append(email)
				            .append("&authCode=")
				            .append(authCode)
				            .append("' target='_blenk'>이메일 인증하기</a>")
				            .toString());
            sendMail.setFrom("shawnshhan@gmail.com", "FilMee");
            sendMail.setTo(email);
            sendMail.send();
			
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}//try-catch
		
	}//sendAuthMail

	//임시 비밀번호 발송ㄴ
	@Override
	public void sendTempPwMail(String email, String tempPw){
		log.debug("sendTempPwMail({}) invoked.", email);
			
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("FilMEE 임시 비밀번호");
			sendMail.setText(
					new StringBuffer()
							.append("<h1>[임시 비밀번호]</h1>")
							.append("<h3>로그인 후 반드시 비밀번호를 변경하세요.</h3>")
							.append("<h2> 임시 비밀번호 : ")
							.append(tempPw)
							.append("</h2>")
				            .toString());
            sendMail.setFrom("shawnshhan@gmail.com", "FilMee");
            sendMail.setTo(email);
            sendMail.send();
			
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}//try-catch

	}//sendTempPwMail

	
	//complaint 의 completion 메일 답변보내기
	@Override
	public void sendComplaintMail(String email, String content,String content_re) {
		log.debug("sendComplaintMail({},{},{}) invoked.", email,content,content_re);
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("FILMEE 요청사항에 대한 답변");
			sendMail.setText(
					new StringBuffer()
							.append("<h1>")
							.append("고객님 요청에 대한 답변 내용입니다.")
							.append("</h1>")
							
							.append("<h2>")
							.append("[요청사항]")
							.append("</h2>")
							
							.append("<h3>")
							.append(content)
							.append("</h3>")
							.append("<hr>")
							
							.append("<h2>")
							.append("[답변]")
							.append("</h2>")
							
							.append("<h3>")
							.append(content_re)
							.append("</h3>")
				            .toString());
            sendMail.setFrom("shawnshhan@gmail.com", "FilMee");
            sendMail.setTo(email);
            sendMail.send();
			
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}//try-catch
		
	}//sendResetPwMail
		
}//end class