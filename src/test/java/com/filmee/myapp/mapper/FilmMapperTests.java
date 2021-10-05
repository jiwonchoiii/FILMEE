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

//@RunWith(SpringRunner.class)
@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class FilmMapperTests {

//	@Resource(type=BoardMapper.class)
//	@Autowired

	@Setter(onMethod_ = @Autowired)
	private FilmMapper mapper; // DI

	@Before
	public void setup() {
		log.debug("setup() invoked.");

		Objects.requireNonNull(this.mapper);
//		assertNotNull(this.mapper);
//		assert this.mapper != null;

		log.info("\t+ mapper: " + this.mapper);
		log.info("\t+ type: " + this.mapper.getClass().getName());
	} // setup

	@Test
	public void testSelectFilmInfo() {
		log.debug("testSelectFilmInfo() invoked.");

		FilmVO filmVO = this.mapper.selectFilmInfo(577922);
		assertNotNull(filmVO);

		log.info("\t+ board: " + filmVO);
	} // testSelectFilmInfo

	@Test
	public void testSelectFilmPeople() {
		log.debug("testSelectFilmPeople() invoked.");

		List<FilmPeopleVO> filmPeopleVO = this.mapper.selectFilmPeople(577922);
		assertNotNull(filmPeopleVO);

		log.info("\t+ board: " + filmPeopleVO);
	} // testSelectFilmPeople

	@Test
	public void testSelectGenre() {
		log.debug("testSelectGenre() invoked.");

		List<FilmGenreVO> genre = this.mapper.selectGenre(577922);
		assertNotNull(genre);

		genre.forEach(log::info);

	} // testSelectGenre

	
	@Test
	public void testInsert() {
		log.debug("testInsert() invoked.");

		ReviewDTO review = new ReviewDTO();

//		ReviewDTO newReview = new ReviewDTO(null, 
//				577922,
//				2, 
//				3.5, 
//				"졸리다",
//				null,  null, null,
//				'f',
//				null);

		int affectedLines = this.mapper.insert(review);
		log.info("\t+ affectedLines: " + affectedLines);
		log.info("\t+ newReview: " + review);

	} // testInsert

	@Test
	public void testSelect() {
		log.debug("testSelect() invoked.");

		ReviewFilmUserVO review = this.mapper.select(43);
		assertNotNull(review);

		log.info("\t+ review: " + review);

	} // testSelect

	@Test
	public void testSelectList() {
		log.debug("testSelectList() invoked.");

		List<ReviewFilmUserVO> reviewList = this.mapper.selectList(577922);
		assertNotNull(reviewList);

		log.info("\t+ review: " + reviewList);

	} // testSelectList

	@Test
	public void testDelete() {
		log.debug("testDeleteReview() invoked.");

		int affectedLines = this.mapper.delete(122);

		log.info("\t+ affectedLines: " + affectedLines);

	} // testDelete

	@Test
	public void testUpdate() {
		log.debug("testUpdate() invoked.");
		

		

		// 기존 리뷰를 변경(업데이트)함.
		ReviewVO review = new ReviewVO(
				126,
				577922,
				3, 
				5.0,
				"또봐도재밌네....22",
				null,null,
				null,
				null
		);

		int updatedReview = this.mapper.modify(review);
		log.info("\t+ updatedReview: " + updatedReview);
	} // testUpdateReview

	
	@Test
	public void testSelectListWithPaging() {
		log.debug("testSelectListWithPaging() invoked.");
		
		Objects.requireNonNull(mapper);
		
		CriteriaFilmReview cri = new CriteriaFilmReview(577922);
//		cri.setCurrPage(1);
//		cri.setAmount(10);
//		cri.setFilm_id(577922);
		
		List<ReviewFilmUserVO> list = mapper.selectListWithPaging(cri);
		
		list.forEach(log::info);
	} // testSelectListWithPaging
	
	
	@Test
	public void testSelectTotalCount() {
		log.debug("testSelectTotalCount() invoked.");
		
		Objects.requireNonNull(mapper);

		CriteriaFilmReview cri = new CriteriaFilmReview(577922);
//		cri.setCurrPage(1);
//		cri.setAmount(10);
		
		int totalAmount = this.mapper.selectTotalCount(577922);
		log.info("\t+ totalAmount: " + totalAmount);
	} // testSelectTotalCount
	
	
	
	@After
	public void tearDown() {
		log.debug("tearDown() invoked.");

	} // tearDown

} // end class