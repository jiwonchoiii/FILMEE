package com.filmee.myapp.service;

import static org.junit.Assert.assertNotNull;

import java.util.Date;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.filmee.myapp.domain.UserDTO;
import com.filmee.myapp.domain.UserVO;

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
public class LoginServiceTests {

	
	@Setter(onMethod_= @Autowired)
	private LoginService service;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assertNotNull(this.service);
		log.info("\t+++++ service : {}", this.service);
	}//setup

	@Test
	public void testLogin() throws Exception {
		log.debug("testLogin() invoked.");
		
		UserDTO dto = new UserDTO();
		dto.setEmail("EMAIL1@GMAIL.COM");
		dto.setPassword("PASS1");
		dto.setRememberMe(false);
		
		UserVO user = this.service.login(dto);
		
		log.info("user : {}", user);
		
	}//testLogin
	
	@Test
	public void testSetUserRememberMe() throws Exception {
		log.debug("testLogin() invoked.");
		
		String email = "EMAIL2@GMAIL.COM";
		String rememberCookie = "sessionId";
		Date rememberAge = new Date(System.currentTimeMillis() + (1000*60*60*24) );
		
		
		int affectedLines = this.service.setUserRememberMe(email, rememberCookie, rememberAge);
		
		log.info("affectedLines : {}", affectedLines);

	}//testSetUserRememberMe
	
	@Test
	public void testFindUserWithCookie() throws Exception{
		log.debug("testSelectUserWithCookie() invoked.");
		
		String cookieValue = "sessionId";
		
		UserVO user = this.service.findUserWithCookie(cookieValue);
		
		log.info("user : {}", user);
		
	}//testSelectUserWithCookie

	@After
	public void tearDown() {
		log.debug("tearDown() invoked.");
	}//tearDown
	
}//end class

