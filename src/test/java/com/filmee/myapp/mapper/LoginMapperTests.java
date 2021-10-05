package com.filmee.myapp.mapper;

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
@ContextConfiguration(locations = 
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
)
public class LoginMapperTests {

	@Setter(onMethod_= @Autowired)
	private LoginMapper mapper;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assertNotNull(mapper);
		log.info("\t+++++ mapper : {}", this.mapper);
	}//setup

	@Test
	public void testSelectUser() throws Exception {
		log.debug("testSelecUser() invoked.");
		
		UserDTO dto = new UserDTO();
		dto.setEmail("22@22.com");
		dto.setPassword("1234");
		
//		String salt = this.mapper.selectSaltByEmail(dto.getEmail());
//		String pw = FilmeeUtil.hashing(dto.getPassword(), salt);
//		
//		dto.setPassword(pw);
		
		UserVO user = this.mapper.selectUser(dto);
		
		log.info("user : {}", user);
		log.info("authCode : {}", user.getAuthCode());
		log.info("authCode.length : {}", user.getAuthCode().length());
	
	}//setup
	
	@Test
	public void testSelectSaltWithEmail() throws Exception {
		log.debug("testSelectSaltByEmail() invoked.");
		
		UserDTO dto = new UserDTO();
		dto.setEmail("22@22.com");
		dto.setPassword("123");
		
		String salt = this.mapper.selectSaltWithEmail(dto.getEmail());
		log.info("salt : {}", salt);	
		
	}//testSelectSaltByEmail
	
	@Test
	public void testUpdateUserRememberMe() throws Exception {
		log.debug("testUpdateUserRememberMe() invoked.");
		
		String email = "EMAIL1@GMAIL.COM";
		String rememberCookie = "sessionId";
		Date rememberAge = new Date(System.currentTimeMillis() + (1000*60*60*24) );
		
		int affectedLines = this.mapper.updateUserRememberMe(email, rememberCookie,rememberAge);
		
		log.info("affectedLines : {}", affectedLines);
		
	}//testUpdateUserRememberMe
	
	@Test
	public void testSelectUserWithCookie() throws Exception{
		log.debug("testSelectUserWithCookie() invoked.");
		
		String cookieValue = "sessionId";
		
		UserVO user = this.mapper.selectUserWithCookie(cookieValue);
		
		log.info("user : {}", user);
		
	}//testSelectUserWithCookie
	
	@After
	public void tearDown() {
		log.debug("tearDown() invoked.");
	}//setup
	
}//end class
