package com.filmee.myapp.mapper;

import com.filmee.myapp.domain.UserDTO;

public interface JoinMapper {

	public abstract int insertUser(UserDTO dto) throws Exception;
	
	public abstract int countUsersWithEmail(String email)throws Exception;
	
	public abstract int countUsersWithNickname(String nickname)throws Exception;
	
//	public abstract String selectAuthCodeWithEmail(String email)throws Exception;
	
	public abstract int updateAuthCodeAuthorized(String email, String authCode)throws Exception;
	
	public abstract int updateUserAsDeleted(Integer userId) throws Exception;
	
	
}//end interface