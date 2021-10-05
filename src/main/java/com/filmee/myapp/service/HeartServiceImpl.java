package com.filmee.myapp.service;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.HeartVO;
import com.filmee.myapp.mapper.BoardMapper;
import com.filmee.myapp.mapper.HeartMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class HeartServiceImpl implements HeartService {
	
	@Autowired private HeartMapper mapper;
	@Autowired private BoardMapper bmapper;
	
	
	@Override
	public int heartInsert(HeartVO vo) {
		log.info("-------------------------------------");
		log.debug(">> heartInsert({})invoked.", vo);
		Objects.requireNonNull(this.mapper);
				
		return this.mapper.heartInsert(vo);
	}//heartinsert
	
	
	@Override
	public int heartCheck(Integer bno, Integer userid) {
		log.info("-------------------------------------");
		log.debug(">> heartCheck({},{})invoked.", bno,userid);
		Objects.requireNonNull(this.mapper);
		
		this.bmapper.heartCnt(bno, 1);
		
		return this.mapper.heartCheck(bno, userid);
	}//heartCheck
	
	
	@Override
	public int heartUncheck(Integer bno, Integer userid) {
		log.info("-------------------------------------");
		log.debug(">> heartUncheck({},{})invoked.", bno,userid);
		Objects.requireNonNull(this.mapper);
		this.bmapper.heartCnt(bno, -1);
		
		return this.mapper.heartUncheck(bno, userid);
	}//heartUncheck
	
	
	@Override
	public HeartVO check(Integer bno, Integer userid) {
		log.info("-------------------------------------");
		log.debug(">> check({},{})invoked.", bno,userid);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.check(bno, userid);
	}


	@Override
	public int heartCnt(Integer bno) {
		log.info("-------------------------------------");
		log.debug(">> check({})invoked.", bno);
				
		return this.mapper.heartCnt(bno);

	}//check

}//end class