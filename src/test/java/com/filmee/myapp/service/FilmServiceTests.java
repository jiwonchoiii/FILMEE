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

import com.filmee.myapp.domain.CriteriaFilmReview;
import com.filmee.myapp.domain.FilmGenreVO;
import com.filmee.myapp.domain.FilmPeopleVO;
import com.filmee.myapp.domain.FilmVO;
import com.filmee.myapp.domain.ReviewDTO;
import com.filmee.myapp.domain.ReviewFilmUserVO;
import com.filmee.myapp.domain.ReviewVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class FilmServiceTests {

	@Setter(onMethod_ = @Autowired)
	private FilmService service;

	@Before
	public void setup() {
		log.debug("setup() invoked.");

		assertNotNull(service);
		log.info("\t+ service : {}", this.service);
	}// setup

	@Test
	public void testGetFilmInfo() {
		log.debug("testGetFilmInfo() invoked.");

		FilmVO filmVO = this.service.getFilmInfo(577922);

		log.info("filmVO : {}", filmVO);

	}// testGetFilmInfo

	@Test
	public void testGetFilmPeople() {
		log.debug("testGetFilmPeople() invoked.");

		List<FilmPeopleVO> filmPeopleVO = this.service.getFilmPeople(577922);

		log.info("filmPeopleVO : {}", filmPeopleVO);

	}// testGetFilmPeople

	@Test
	public void testGetGenre() {
		log.debug("testGetGenre() invoked.");

		List<FilmGenreVO> filmGenreVOList= this.service.getGenre(577922);

		filmGenreVOList.forEach(log::info);

	}// testGetGenre
	

//--------------------------------------------------------------//
	@Test
	public void testRegister() {
		log.debug("testRegister() invoked.");
		
		ReviewDTO review = new ReviewDTO();
//		ReviewDTO review =
//			new ReviewDTO(
//				null, 
//				577922, 
//				3, 
//				4.5,  
//				"테넷 리뷰3", 
//				null, null, null,
//				'f',0);
		
		log.info("\t+ review: " + review);
		
		if(service.register(review) == 1) {
			log.info("\t+ 새로운 리뷰가 등록되었습니다.");
			log.info("\t+ board: {}", review);
		} else {
			log.info("\t+ 리뷰가 등록되지 않았습니다.");
		} // if-else
	} // testRegister
	
	@Test
	public void testGet() {
		log.debug("testGet() invoked.");
		
		ReviewFilmUserVO review = this.service.get(130);

		log.info("\t+ review: {}", review);

	} // testGet

	@Test
	public void testGetList() {
		log.debug("testGetList() invoked.");
		
		List<ReviewFilmUserVO> reviewList = this.service.getList(577922);

		log.info("\t+ reviewList: {}", reviewList);

	} // testGetList
	
	@Test
	public void testRemove() {
		log.debug("testRemove() invoked.");
		
		int removedReview = this.service.remove(130);

		if(removedReview == 1) {
			log.info("\t+ 리뷰가 정상적으로 삭제되었습니다.");
		} else {
			log.info("\t+ 리뷰 삭제 오류");
		} // if-else
	} // testRemove
	
	@Test
	public void testModify() {
		log.debug("testModify() invoked.");

		
	
		ReviewVO review = 
			new ReviewVO(
				131, 
				577922, 
				3, 
				4.5, 
				"테넷ㅅㅅㅅㅅㅅ", 
				null, null,null,
				null);
		
		log.info("\t+ review: " + review);
		
		if(service.modify(review) == 1) {
			log.info("\t+ 리뷰가 수정되었습니다.");
			log.info("\t+ review: {}", review);
		} else {
			log.info("\t+ 리뷰 수정 오류");
		} // if-else
	} // testModify
	
	
	@Test
	public void testGetListWithPaging() {
		log.debug("testGetListWithPaging() invoked.");
		
		CriteriaFilmReview cri = new CriteriaFilmReview(577922);
		cri.setCurrPage(1);
		cri.setAmount(5);
		cri.setPagesPerPage(10);
		
		List<ReviewFilmUserVO> reviewList = this.service.getListWithPaging(cri);
		reviewList.forEach(log::info);
		
		reviewList.clear();
		reviewList = null;
	} // testGetListWithPaging

	
	@Test
	public void testGetTotalCount() {
		log.debug("testGetTotalCount() invoked.");
		
		CriteriaFilmReview cri = new CriteriaFilmReview(577922);
		cri.setCurrPage(1);
		cri.setAmount(10);
		
		int totalAmount = this.service.getTotalCount(577922);
		log.info("\t+ totalAmount: {}", totalAmount);
	} // testGetTotalCount
	
	
	@After
	public void tearDown() {
		
		log.debug("tearDown() invoked.");
	}// setup

}