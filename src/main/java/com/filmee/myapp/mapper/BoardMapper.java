package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.BoardUserVO;
import com.filmee.myapp.domain.BoardVO;
import com.filmee.myapp.domain.Criteria;

public interface BoardMapper {
	
	public abstract List<BoardUserVO> getList(Criteria cri); 	//메인 list 가져오기
	
	public abstract BoardUserVO select(Integer bno);			//상세조회
	
	public abstract int insertSelectKey(BoardVO board);		//작성
	
	public abstract int update(BoardVO board);	//수정
	
	public abstract int delete(Integer bno);	//삭제
	
	public abstract int getTotalCount(Criteria cri);	//게시판의 총 게시물 개수
	
	public abstract int viewCnt(Integer bno, Integer amount);	//조회수
	
	public abstract void commentCnt(Integer bno, Integer amount);	//댓글 수 +-
	
	public abstract void heartCnt(Integer bno, Integer amount);	//좋아요 수 +-

}//end interface 