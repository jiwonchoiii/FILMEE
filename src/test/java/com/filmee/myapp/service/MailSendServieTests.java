package com.filmee.myapp.service;

import java.util.Objects;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class MailSendServieTests {

	@Setter(onMethod_=@Autowired)
	MailSendService mss;
	
	@Before
	public void setup() {
		log.debug("setup() invoked");
		
		Objects.requireNonNull(mss);
		log.info("mss : {}", mss);
	}//setup
	
	@Test
	public void testSendAuthMail() {
		log.debug("testSendAuthMail() invoked.");
		
		String authCode = mss.getRandomCode(MailSendService.EMAIL);
		mss.sendAuthMail("hansh9501@nm", authCode);
	
		log.info(authCode);
	}//testSendAuthMail
}//end class
