package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.Criteria;
import com.filmee.myapp.domain.UserCountsVO;
import com.filmee.myapp.domain.UserVO;

public interface AdminUserMapper {

	public abstract List<UserVO> getList(Criteria cri);
	
	public abstract int getTotalCount(Criteria cri);

	public abstract int updateIsAdmin(Integer userId);
	
	public abstract UserCountsVO getUsersCount();
	
}//end interface
