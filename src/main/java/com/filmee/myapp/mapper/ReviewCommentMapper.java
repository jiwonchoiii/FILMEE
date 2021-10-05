package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.ReviewCommentUserVO;
import com.filmee.myapp.domain.ReviewCommentVO;

public interface ReviewCommentMapper {

	public abstract int insert(ReviewCommentVO comment);	//댓글 작성
	
	public abstract List<ReviewCommentUserVO> list(Integer rno);	//댓글 조회
	
	public abstract ReviewCommentVO read(Integer rno);	//특정 댓글 조회
	
	public abstract int delete(Integer rcno);			//댓글 삭제
	
	public abstract int update(ReviewCommentVO comment);	//댓글 수정
				
}//end interface