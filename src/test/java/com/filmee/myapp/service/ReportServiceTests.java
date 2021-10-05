package com.filmee.myapp.service;

import java.util.List;
import java.util.Objects;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.filmee.myapp.domain.CriteriaReport;
import com.filmee.myapp.domain.ReportVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class ReportServiceTests {

	@Autowired private ReportService service;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		Objects.requireNonNull(this.service);
	}
	
//	@Test
//	public void test() {
//		log.debug("test() invoked.");
//		
//		ReportVO report = new ReportVO(null, "1", 401, "BNO", 531, 1, "허위신고", null, null, null, null, null);
//		this.service.reportRegister(report);
//	}
	
	@Test
	public void testGetList() {
		CriteriaReport cri = new CriteriaReport();
		
		List<ReportVO> list = this.service.getList(cri);
		list.forEach(log::info);
	}
	
	@Test
	public void testGetTotal() {
		CriteriaReport cri = new CriteriaReport();
		int aLine=this.service.getTotal(cri);
		System.out.println("--- aline : "+aLine);
	}
}
