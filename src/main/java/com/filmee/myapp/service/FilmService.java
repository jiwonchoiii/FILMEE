package com.filmee.myapp.service;

import java.util.List;

import com.filmee.myapp.domain.CriteriaFilmReview;
import com.filmee.myapp.domain.FilmGenreVO;
import com.filmee.myapp.domain.FilmPeopleVO;
import com.filmee.myapp.domain.FilmVO;
import com.filmee.myapp.domain.ReviewDTO;
import com.filmee.myapp.domain.ReviewFilmUserVO;
import com.filmee.myapp.domain.ReviewHeartVO;
import com.filmee.myapp.domain.ReviewVO;

public interface FilmService {
	
	public abstract FilmVO getFilmInfo(Integer film_id); // 영화정보
	public abstract List<FilmPeopleVO> getFilmPeople (Integer film_id); // 감독, 배우
	public abstract List<FilmGenreVO> getGenre(Integer film_id); // 장르 
	
	//-----------------------------------------------------------//
	
	public abstract int register(ReviewDTO review);  // 새로운 리뷰 등록
	public abstract ReviewFilmUserVO get(Integer rno);	// 특정 리뷰 조회
	public abstract List<ReviewFilmUserVO> getList(Integer film_id);	// 특정 영화의 리뷰 목록 조회(recent review)	

	public abstract int remove(Integer rno);	// 특정 리뷰 삭제
	public abstract int modify(ReviewVO review);	// 특정 리뷰 수정
	
	public abstract List<ReviewFilmUserVO> getListWithPaging(CriteriaFilmReview criFR);	// 페이징처리된 리뷰 목록조회
	public abstract int getTotalCount(Integer film_id);	// 영화당 리뷰 갯수 얻기  
	
	//-----------------------------------------------------------//
	
	//리뷰 좋아요 
	
	public abstract int heartInsert(ReviewHeartVO vo);	//처음이라면 insert
	
	public abstract int heartCheck(Integer rno, Integer userid);	//좋아요를 눌렀을 때
	
//	public abstract int heartCheckTotal(Integer rno);   // fm_review에 해당 리뷰의 토탈 좋아요수에 +1 -1  
	
	public abstract int heartUncheck(Integer rno, Integer userid);	//좋아요를 취소할 때
	
	public abstract ReviewHeartVO check(Integer rno, Integer userid); //좋아요 되어 있는지 확인
	
	public abstract int heartCnt(Integer rno);	//좋아요 개수

} // end class 