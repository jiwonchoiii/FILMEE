package com.filmee.myapp.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.Criteria;
import com.filmee.myapp.domain.UserCountsVO;
import com.filmee.myapp.domain.UserVO;
import com.filmee.myapp.mapper.AdminUserMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class AdminUserServiceImpl 
	implements AdminUserService, InitializingBean {

	@Setter(onMethod_=@Autowired)
	private AdminUserMapper mapper;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		log.debug("afterPropertiesSet() invoked.");
		
		Objects.requireNonNull(this.mapper);
	}//afterPropertiesSet
	
	@Override
	public List<UserVO> getList(Criteria cri) {
		log.debug("getList({}) invoked.", cri);
		
		return this.mapper.getList(cri);
	}//getList
	
	@Override
	public int getTotal(Criteria cri) {
		log.debug("getTotal({}) invoked.", cri);
				
		return this.mapper.getTotalCount(cri);
	}//getTotal

	@Override
	public int changeUserAdmin(Integer userId) {
		log.debug("changeUserAdmin({}) invoked.", userId);

		int affectedLines = this.mapper.updateIsAdmin(userId);

		return 0;
	}//changeUserAdmin


	@Override
	public UserCountsVO getUsersStatus() {
		log.debug("getUsersStatus() invoked.");
		
		UserCountsVO vo = this.mapper.getUsersCount();
		
		log.info("vo : {}",vo);
				
		return vo;
	}//getUsersStatus
	
	


	

}//end class
