package com.filmee.myapp.service;

import java.util.List;

import com.filmee.myapp.domain.ComCriteria;
import com.filmee.myapp.domain.ComplaintVO;
import com.filmee.myapp.domain.UserDTO;
import com.filmee.myapp.domain.UserVO;

public interface ComplaintService {

	
	public abstract boolean register(ComplaintVO complaint);	//요청글 등록
	
	public abstract List<ComplaintVO> getList();				//요청 목록조회
	
	public abstract List<ComplaintVO> getListPerPage(ComCriteria cri);
	
	public abstract boolean temporaryUpdate(ComplaintVO complaint);	//요청글 임시 수정 
	
	public abstract boolean completion(ComplaintVO complaint);	//요청글 최종 수정
	
	public abstract ComplaintVO get(Integer compno);			//요청 게시글 상세조회
	
	public abstract int getTotal(ComCriteria cri);					//총 레코드 수 구하기


}
