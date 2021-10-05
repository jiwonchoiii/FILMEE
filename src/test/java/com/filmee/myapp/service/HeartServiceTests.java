package com.filmee.myapp.service;

import java.util.Objects;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.filmee.myapp.domain.HeartDTO;
import com.filmee.myapp.domain.HeartVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
	})
public class HeartServiceTests {
	
	@Autowired private HeartService service;
	
	@Before
	public void setup() {
		log.debug("setup() inovked.");
		
		Objects.requireNonNull(this.service);
	}
	
	@Test
	public void testCheck() {
		log.debug("testCheck() inovked.");
		
		log.info("total >>> "+this.service.check(533, 401));
	}//testHeartInsert
	
	
//	@Test
//	public void testInsert() {
//		log.debug("testInsert() inovked.");
//		HeartDTO dto = null;
//		dto.setBno(123);
//		dto.setHno(1);
//		dto.setLikecheck(1);
//		dto.setUserid(123);
//
//		this.service.heartInsert(dto);
//	}//testInsert
	
	@Test
	public void testLikeCheck() {
		log.debug("testLikeCheck() invoked.");
		
		this.service.heartCheck(533,401);
	}
	
	@Test
	public void testUnCheck() {
		log.debug("testunCheck()invoked.");
		
		this.service.heartUncheck(533, 401);
	}
	
	
	@Test
	public void testCnt() {
		this.service.heartCnt(531);
	}

}
