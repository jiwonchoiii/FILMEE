package com.filmee.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.filmee.myapp.domain.BoardCommentUserVO;
import com.filmee.myapp.domain.BoardCommentVO;
import com.filmee.myapp.domain.Criteria;

public interface BoardCommentMapper {

	public abstract int insert(BoardCommentVO comment);	//댓글 작성
	
	public abstract List<BoardCommentUserVO> list(Integer bno);	//댓글 조회
	
	public abstract BoardCommentVO read(Integer bno);	//특정 댓글 조회
	
	public abstract int delete(Integer bcno);			//댓글 삭제
	
	public abstract int update(BoardCommentVO comment);	//댓글 수정
				
}//end interface