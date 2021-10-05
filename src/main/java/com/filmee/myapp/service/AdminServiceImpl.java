package com.filmee.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.AdminVO;
import com.filmee.myapp.mapper.AdminMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired private AdminMapper mapper;


	@Override
	public AdminVO totalCount() {
		log.debug(">>totalCount Service () invoked.");
		
		AdminVO total = this.mapper.totalCount();
		
		return total;
	}//totalCount

}//end class
