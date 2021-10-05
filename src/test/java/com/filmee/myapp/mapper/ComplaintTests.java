package com.filmee.myapp.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.List;
import java.util.Objects;

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
import lombok.extern.log4j.Log4j2;



@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class ComplaintTests {

	//@Setter(onMethod_=@Autowired)
	@Autowired
	private ComplaintMapper mapper;

	
	
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		Objects.requireNonNull(this.mapper);
//		assertNotNull(this.mapper);   
//		assert this.mapper !=null;
		log.info("\t+mapper:"+this.mapper);

		log.info("\t+type:"+this.mapper.getClass().getName());
	}//setup
	
	@Test 
	public void testGetList() {
		log.debug("testGetList() invoked.");

		List<ComplaintVO> list = this.mapper.getList();
		assert list != null;
		
		log.info("\t+mapper:"+list);
	}
//	
//	
//	@Test(timeout=1000)
//	public void testGetListWithPaging() {
//		log.debug("testGetListWithPaging() invoked.");
//		
//		Objects.requireNonNull(mapper);
//		
//		Criteria cri = new Criteria();
//		cri.setCurrPage(3);
//		cri.setAmount(20);
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		list.forEach(log::info);
//	}
//
//	
//	
	@Test
	public void testPaging() {
		log.debug("testRead() invoked.");

		ComplaintVO complaint =this.mapper.select(22);

		assertNotNull(complaint);
		log.info("\t+complaint:"+complaint);
	}
	
	@Test
	public void testSelect() {
		log.debug("testRead() invoked.");

		ComplaintVO complaint =this.mapper.select(22);

		assertNotNull(complaint);
		log.info("\t+complaint:"+complaint);
	}

	
	@Test
	public void testGetPagingUri() {
		log.debug("testGetPagingUri() invoked.");
		
		ComCriteria cri = new ComCriteria();
		cri.setCurrPage(2);
		cri.setAmount(5);
		
//		cri.setPagesPerPage(10);
		
		cri.setCode("1");		//검색유형 : T(제목) ,  C(내용)   ,W(작성자)
	
	
		List<ComplaintVO> list = mapper.getListWithPaging(cri);
		list.forEach(log::info);
	}
	@Test
	public void testInsert() {
		log.debug("testInsert() invoked.");
		
//		private Integer compno;
//		private Integer code;
//		private Integer writer;
//		private String content;
//		private Timestamp insert_ts;
//		private Timestamp check_ts;
//		private Timestamp complete_ts;
//		private	Integer mgr_id;
//		private Integer send;
		
		ComplaintVO newComplaint = new ComplaintVO(
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
		int affectedLines = this.mapper.insert(newComplaint);
		log.info("\t+affectedLines:"+affectedLines);
	}
	/*
	 * INSERT INTO tbl_board(title,content,writer)
	 * VALUES(#{title},#{content},#{writer});
	 * 
	 * 어덯게 MyBatis는 우리가 준 객체로부터 위의 바인드 변수의 값을 추출해내는가?
	 * 
	 * 1. 만약 우리가 준 객체가 자바빈즈 규약을 따르는 객체라면, "get{프로퍼티명}()
	 */
	@Test
	public void testUpdate() {
		log.debug("testUpdate() invoked.");
		
		//기존 게시글을 변경(업데이트)함.
		ComplaintVO updateComplaint = new ComplaintVO(
				22,
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
		int affectedLines =this.mapper.update(updateComplaint);

		log.info("\t+affectedLines:"+affectedLines);
	}
	
//	@Test
//	public void testInsertSelectKey() {
//		log.debug("testInsertSelectKey() invoked.");
//		
//		BoardVO newBoard = new BoardVO(
//				null,
//				"TITLE_1001",
//				"CONTENT_1001",
//				"WRITER_1001",
//				null,
//				null
//				);
//		int affectedLines = this.mapper.insert(newBoard);
//		log.info("\t+affectedLines:"+affectedLines);
//		log.info("\t+newboard:"+newBoard);
//	}
//	
//	
//	@Test
//	public void getTotalCount() {
//		log.debug("getTotalCount() invoked.");
//		
//		
//		
//		Criteria cri = new Criteria();
//		cri.setCurrPage(3);
//		cri.setAmount(10);
//		
//		Integer totalAmount =this.mapper.getTotalCount(cri);
//		log.info("\t+totalAmount:"+totalAmount);
//		
//	}
	
	
	
	@After
	public void tearDown() {
		log.debug("tearDown() invoked.");

	}
	
	
	
	
	
	
}
