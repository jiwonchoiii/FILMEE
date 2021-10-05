package com.filmee.myapp.service;

import java.util.Objects;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.filmee.myapp.domain.AdminVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
	})
public class AdminServiceTests {

	@Autowired private AdminService service;
	
	@Test
	public void testCount() {
		log.debug("testCount invoked.");
		Objects.requireNonNull(this.service);
		AdminVO admin = this.service.totalCount();
		log.info("====================");
		log.info("count:"+admin);
		log.info("====================");
	}
	
}
