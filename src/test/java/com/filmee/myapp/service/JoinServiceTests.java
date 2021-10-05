package com.filmee.myapp.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.filmee.myapp.domain.UserDTO;

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
public class JoinServiceTests {

	@Setter(onMethod_=@Autowired)
	private JoinService service;
	
	@Before
	public void setup() {
		log.debug("setup invoked.");
		
		assertNotNull(this.service);
	}//setup
	
	@Test
	public void testJoin() throws Exception {
		log.debug("join() invoked.");
		
		UserDTO dto = new UserDTO();
		dto.setEmail("1234@1234.com");
		dto.setNickname("진모천재짱짱");
		dto.setPassword("1234");
		
		int affectedLines = this.service.join(dto);
		
		log.info("affectedLines : {}", affectedLines);
		
	}//testJoin
	
	@Test
	public void testCheckEmailDuplicated() throws Exception{
		log.debug("testCheckEmailDuplicated invoked.");
		
		String email = "123@123.com";
		
		int result = this.service.checkEmailDuplicated(email);
		
		log.info("result : {}", result);
		
	}//testCheckEmailDuplicated
	
	@Test
	public void testisEmailAuthroized()throws Exception{
		log.debug("updateAuthCodeNull() invoked.");
		
		String email = "22@22.com";
		String authCode = "238365";
		
		boolean isAuthorized= this.service.isEmailAuthorized(email, authCode);
		
		log.info("affectedLines : {}", isAuthorized);
	}//updateAuthCodeNull
	
	@Test
	public void testDeleteAccount() throws Exception{
		log.debug("testDeleteAccount() invoked");
		
		Integer userId = 228;
		int affectedLines = this.service.deleteAccount(userId);
		
		log.info(affectedLines);
		
	}//testDeleteAccount
	
}//end class