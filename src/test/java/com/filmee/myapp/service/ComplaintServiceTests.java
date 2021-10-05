package com.filmee.myapp.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.filmee.myapp.domain.ComCriteria;
import com.filmee.myapp.domain.ComplaintVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})     
public class ComplaintServiceTests {
   
   @Setter(onMethod_= {@Autowired})
   private ComplaintService service;         //테스트 대상 객체
   
   @Before
   public void setup() {
      log.debug("setup() invoked.");
      
      assertNotNull(this.service);
      
      log.info("\t+ service : {}", this.service);      
   } //setup
   
   @Test
   public void testGetList() {
      log.debug("testGetList() invoked.");
      
      List<ComplaintVO> complaint = this.service.getList();
      
      assertNotNull(complaint);
      
      complaint.forEach(log::info);
      
      complaint.clear();
      complaint = null;      
   } //testGetList
   
   @Test
   public void testRegister() {
      log.debug("testRegister() invoked.");
      
      ComplaintVO complaint = new ComplaintVO(
    			null,
				1,
				1,
				"content_1002",
				null,
				null,
				null,
				null,
				1,
				null
				);
      
      if(service.register(complaint)) {
         log.info("\t+ new complaint registered.");
         log.info("\t+ complaint : {}", complaint);
      } else {
         
         log.info("complaint register failed");
      } //if-else      
   
   } //testRegister
   @Test(timeout= 500)
	public void testGetListPerPage() {
		log.debug("testGetListPerPage() invoked.");
		ComCriteria cri = new ComCriteria();
		cri.setCurrPage(2);
		cri.setAmount(5);
		
		List<ComplaintVO> complaint =this.service.getListPerPage(cri);
		complaint.forEach(log::info);
		
		complaint.clear();
		complaint=null;
	}
   
   @Test
   public void testTemporary() {
      log.debug("testModify() invoked.");
      Integer compno = 444;
      ComplaintVO complaint = new ComplaintVO(
				70,
				1,
				1,
				"temporary",
				null,
				null,
				null,
				null,
				1,
				null
				);
      
      if(service.temporaryUpdate(complaint)) {
         log.info("\t+ the specified complaint updated.");
         log.info("\t+ complaint : {}", complaint);
      } else {
         log.info("complaint update failed");
      }
   } //testModify
   

   
   @Test
   public void testGet() {
      log.debug("testGet() invoked.");
      
      ComplaintVO complaint = this.service.get(70);
      
      log.info("\t+ complaint : {}", complaint);
   } //testGet
   
   @After
   public void tearDown() {
      log.debug("tearDown() invoked.");
      
   } //tearDown
//   @Test(timeout=1000)
//	public void getTotal() {
//		log.debug("getTotal() invoked.");
//
//		Criteria cri = new Criteria();
//		cri.setCurrPage(3);
//		cri.setAmount(10);
//		
//		Integer totalAmount = this.service.getTotal(cri);
//		log.info("\t+totalAmount : {}",totalAmount);
//	}//totalAmount

} //end class