package com.filmee.myapp.service;

import java.util.List;

import com.filmee.myapp.domain.ReviewCommentUserVO;
import com.filmee.myapp.domain.ReviewCommentVO;

public interface ReviewCommentService {
	
	public abstract List<ReviewCommentUserVO> getList(Integer rno);	//전체조회
	
	public abstract ReviewCommentVO get(Integer bcno);	//상세조회
	
	public abstract int register(ReviewCommentVO vo);	//작성
		
	public abstract int modify(ReviewCommentVO vo);		//수정
	
	public abstract int remove(Integer rcno);			//삭제
		

}//end interface 