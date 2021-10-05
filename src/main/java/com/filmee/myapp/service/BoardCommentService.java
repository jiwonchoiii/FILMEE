package com.filmee.myapp.service;

import java.util.List;

import com.filmee.myapp.domain.BoardCommentUserVO;
import com.filmee.myapp.domain.BoardCommentVO;
import com.filmee.myapp.domain.Criteria;
import com.filmee.myapp.domain.BoardPageDTO;

public interface BoardCommentService {
	
	public abstract List<BoardCommentUserVO> getList(Integer bno);	//전체조회
	
	public abstract BoardCommentVO get(Integer bcno);	//상세조회
	
	public abstract int register(BoardCommentVO vo);	//작성
		
	public abstract int modify(BoardCommentVO vo);		//수정
	
	public abstract int remove(Integer bcno);			//삭제
		

}//end interface 