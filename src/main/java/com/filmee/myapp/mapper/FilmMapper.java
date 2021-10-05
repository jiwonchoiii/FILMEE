package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.CriteriaFilmReview;
import com.filmee.myapp.domain.FilmGenreVO;
import com.filmee.myapp.domain.FilmPeopleVO;
import com.filmee.myapp.domain.FilmReaction3VO;
import com.filmee.myapp.domain.FilmVO;
import com.filmee.myapp.domain.ReviewDTO;
import com.filmee.myapp.domain.ReviewFilmUserVO;
import com.filmee.myapp.domain.ReviewHeartVO;
import com.filmee.myapp.domain.ReviewVO;

public interface FilmMapper {

	public abstract FilmVO selectFilmInfo(Integer film_id); // 영화 정보 select

	public abstract List<FilmPeopleVO> selectFilmPeople(Integer film_id); // 감독, 배우 select

	public abstract List<FilmGenreVO> selectGenre(Integer film_id); // 장르 select

	// ---------------------------------------------------------//
	// 리뷰 관련
	// ---------------------------------------------------------//

	public abstract int insert(ReviewDTO review); // 새로운 리뷰 등록

	public abstract ReviewFilmUserVO select(Integer rno); // 특정 리뷰 조회

	public abstract List<ReviewFilmUserVO> selectList(Integer film_id); // 특정 영화의 리뷰 목록 조회(recent review)

	public abstract int delete(Integer rno); // 특정 리뷰 삭제

	public abstract int modify(ReviewVO review); // 특정 리뷰 수정

	public abstract List<ReviewFilmUserVO> selectListWithPaging(CriteriaFilmReview cri); // 페이징처리된 리뷰 목록조회

	public abstract int selectTotalCount(Integer film_id); // 리뷰의 총 레코드 건수 얻기

	// ------------------------------------------------------------------------//

	public abstract int heartInsert(ReviewHeartVO vo); // 처음이라면 insert

	public abstract int heartCheck(Integer rno, Integer userId); // 좋아요를 눌렀을 때

	public abstract int heartCheckTotal(Integer rno); // fm_review에 해당 리뷰의 토탈 좋아요수에 +1 -1

	public abstract int heartUncheck(Integer rno, Integer userId); // 좋아요를 취소할 때

	public abstract ReviewHeartVO check(Integer rno, Integer userId); // 좋아요 되어 있는지 확인

	public abstract int heartCnt(Integer rno); // 좋아요 개수

	public abstract void commentCnt(Integer rno, Integer amount); // 댓글 수 +-

	public abstract void heartCntChange(Integer rno, Integer amount); // 좋아요 수 +-
	

	// ------------------------------------------------------------------------//
	// 영화 좋아요, 보고싶은 영화, 본 영화
	// ------------------------------------------------------------------------//

	public abstract boolean likedFilm(FilmReaction3VO fr); // 좋아요
	public abstract boolean unLikedFilm(FilmReaction3VO fr); // 좋아요 취소 
	
	
} // end interface