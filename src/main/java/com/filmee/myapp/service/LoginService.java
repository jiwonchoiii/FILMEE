package com.filmee.myapp.service;

import java.util.Date;

import com.filmee.myapp.domain.UserDTO;
import com.filmee.myapp.domain.UserVO;


public interface LoginService {
	
	public abstract UserVO login(UserDTO dto) throws Exception;
	
	public abstract String getUserSalt(String email) throws Exception;
	
	public abstract int setUserRememberMe(String email, String remebmerCookie, Date rememberAge) throws Exception;
	
	public abstract UserVO findUserWithCookie(String cookieValue) throws Exception;
	
	public abstract int changePassword(UserDTO dto) throws Exception;
	
	//myPage쪽으로 넘어갈 부분

}//end interface
