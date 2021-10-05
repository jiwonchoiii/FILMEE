package com.filmee.myapp.mapper;

import java.util.Date;

import com.filmee.myapp.domain.UserDTO;
import com.filmee.myapp.domain.UserVO;

public interface LoginMapper {

	public abstract UserVO selectUser(UserDTO dto) throws Exception;
	
	public abstract UserVO selectUserBySocialEmail(String email) throws Exception;
	
	public abstract String selectSaltWithEmail(String email) throws Exception;
	
	public abstract int updateUserRememberMe(String email, String rememberCookie, Date rememberAge) throws Exception;

	public abstract UserVO selectUserWithCookie(String cookieValue) throws Exception;
	
	//myPage쪽으로 넘어갈 부분
	public abstract int updatePassword(UserDTO dto) throws Exception;
}//end interface