package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.ComCriteria;
import com.filmee.myapp.domain.ComplaintVO;
import com.filmee.myapp.domain.UserVO;

public interface ComplaintMapper {

	public abstract List<ComplaintVO> getList();					//요청글 목록조회
	
	public abstract Integer insert(ComplaintVO compno);				//새로운 요청글 등록
	
	public abstract ComplaintVO select(Integer compno);				//특정 요청글 조회 

	public abstract Integer update(ComplaintVO complaint);				//특정 요청 임시수정

	public abstract Integer updateEnd(ComplaintVO complaint);				//특정 요청 최종수정
	
	public abstract List<ComplaintVO> getListWithPaging(ComCriteria cri);	//페이징
	
	public abstract int getTotalCount(ComCriteria cri);	// 게시판의 총 레코드 건수 얻기
	
	public abstract String userEmail(Integer compno); //요청완료에 필요한 이메일
}
