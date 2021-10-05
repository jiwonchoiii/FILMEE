package com.filmee.myapp.service;

import java.util.List;
import java.util.Objects;

import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.CriteriaFilmReview;
import com.filmee.myapp.domain.FilmGenreVO;
import com.filmee.myapp.domain.FilmPeopleVO;
import com.filmee.myapp.domain.FilmVO;
import com.filmee.myapp.domain.ReviewDTO;
import com.filmee.myapp.domain.ReviewFilmUserVO;
import com.filmee.myapp.domain.ReviewHeartVO;
import com.filmee.myapp.domain.ReviewVO;
import com.filmee.myapp.mapper.FilmMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@Service
public class FilmServiceImpl implements FilmService {

	private FilmMapper mapper;



	@Override
	public FilmVO getFilmInfo(Integer film_id) {
		log.debug("getFilmInfo({}) invoked.", film_id);

		Objects.requireNonNull(this.mapper);

		return this.mapper.selectFilmInfo(film_id);
	} // getFilmInfo

	@Override
	public List<FilmPeopleVO> getFilmPeople(Integer film_id) {
		log.debug("getFilmPeople({}) invoked.", film_id);

		Objects.requireNonNull(this.mapper);

		return this.mapper.selectFilmPeople(film_id);
	} // getFilmPeople

	@Override
	public List<FilmGenreVO> getGenre(Integer film_id) {
		log.debug("getGenre({}) invoked.", film_id);

		Objects.requireNonNull(this.mapper);

		return this.mapper.selectGenre(film_id);
	}

	// ---------------------------------------------------------//

	@Override
	public int register(ReviewDTO review) {
		log.debug("register({}) invoked.", review);

		Objects.requireNonNull(this.mapper);
		return  this.mapper.insert(review);
	} // register

	@Override
	public ReviewFilmUserVO get(Integer rno) {
		log.debug("get({}) invoked.", rno);

		Objects.requireNonNull(this.mapper);
		return this.mapper.select(rno);
		
	} // get

	@Override
	public List<ReviewFilmUserVO> getList(Integer film_id) {
		log.debug("getList({}) invoked.", film_id);

		Objects.requireNonNull(this.mapper);
		return this.mapper.selectList(film_id);
	} // getList

	@Override
	public int remove(Integer rno) {
		log.debug("remove({}) invoked.", rno);

		Objects.requireNonNull(this.mapper);
		return this.mapper.delete(rno);
	} // remove

	@Override
	public int modify(ReviewVO review) {
		log.debug("modify({}) invoked.", review);
		
		Objects.requireNonNull(this.mapper);
		return this.mapper.modify(review);
	} // modify

	@Override
	public List<ReviewFilmUserVO> getListWithPaging(CriteriaFilmReview cri) {
		log.debug("getListWithPaging({}, {}) invoked.",  cri);
		
		Objects.requireNonNull(this.mapper);
		return this.mapper.selectListWithPaging(cri);
	} // getListWithPaging

	@Override
	public int getTotalCount(Integer film_id) {
		log.debug("getTotalCount({}, {}) invoked.", film_id);
		
		Objects.requireNonNull(this.mapper);
		return this.mapper.selectTotalCount(film_id);
	}

	
	// 리뷰 좋아요 
	@Override
	public int heartInsert(ReviewHeartVO vo) {
		log.info("-------------------------------------");
		log.debug(">> heartInsert({})invoked.", vo);
		Objects.requireNonNull(this.mapper);
				
		return this.mapper.heartInsert(vo);
	}//heartinsert
	
	
	@Override
	public int heartCheck(Integer rno, Integer userId) {
		log.info("-------------------------------------");
		log.debug(">> heartCheck({},{})invoked.", rno,userId);
		Objects.requireNonNull(this.mapper);
		
		this.mapper.heartCntChange(rno, 1);
		
		return this.mapper.heartCheck(rno, userId);
	}//heartCheck
	
//	@Override
//	public int heartCheckTotal(Integer rno) {
//		log.info("-------------------------------------");
//		log.debug(">> heartCheckTotal({})invoked.", rno);
//		
//		Objects.requireNonNull(this.mapper);
//		
//		return this.mapper.heartCheckTotal(rno);
//		
//	
//	}//heartCheckTotal
	
	@Override
	public int heartUncheck(Integer rno, Integer userId) {
		log.info("-------------------------------------");
		log.debug(">> heartUncheck({},{})invoked.", rno,userId);
		Objects.requireNonNull(this.mapper);
		
		this.mapper.heartCntChange(rno, -1);
		
		return this.mapper.heartUncheck(rno, userId);
	}//heartUncheck
	
	
	@Override
	public ReviewHeartVO check(Integer rno, Integer userId) {
		log.info("-------------------------------------");
		log.debug(">> check({},{})invoked.", rno, userId);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.check(rno, userId);
	} // check 


	@Override
	public int heartCnt(Integer rno) {
		log.info("-------------------------------------");
		log.debug(">> heartCnt({})invoked.", rno);
				
		return this.mapper.heartCnt(rno);

	} // heartCnt

} // end class