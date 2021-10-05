package com.filmee.myapp.service;

import java.util.List;

import com.filmee.myapp.domain.Criteria;
import com.filmee.myapp.domain.UserCountsVO;
import com.filmee.myapp.domain.UserVO;

public interface AdminUserService {
	
	public abstract List<UserVO> getList(Criteria cri);	//총 유저 조회
	
	public abstract int getTotal(Criteria cri);			//총 레코드 수 구하기

	public abstract int changeUserAdmin(Integer userId);	//유저 관리자 권환 설정
	
	public abstract UserCountsVO getUsersStatus();	//총 회원 수, 탈퇴한 회원 수 구하기


}//end interface
