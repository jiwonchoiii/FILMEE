 package com.filmee.myapp.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.BoardCommentUserVO;
import com.filmee.myapp.domain.BoardCommentVO;
import com.filmee.myapp.domain.Criteria;
import com.filmee.myapp.mapper.BoardCommentMapper;
import com.filmee.myapp.mapper.BoardMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2 
@NoArgsConstructor

@Service 
public class BoardCommentServiceImpl implements BoardCommentService {
	
	@Autowired private BoardCommentMapper mapper;
	@Autowired private BoardMapper bmapper;

	@Override
	public List<BoardCommentUserVO> getList(Integer bno) {
		log.debug(" >> list({}) invoked.", bno);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.list(bno);
	}

	@Override
	public BoardCommentVO get(Integer bcno) {
		log.debug(" >> get({}) invoked.", bcno);
		log.debug("get({}) invoked.");
		Objects.requireNonNull(this.mapper);

		return this.mapper.read(bcno);
	}//get

	@Override
	public int register(BoardCommentVO vo) {
		log.debug(" >> register({}) invoked.", vo);
		Objects.requireNonNull(this.mapper);
		this.bmapper.commentCnt(vo.getBno(), 1);
		
		return this.mapper.insert(vo);
	}//register

	@Override
	public int modify(BoardCommentVO vo) {
		log.debug(" >> BoardCommentVO({}) invoked.", vo);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.update(vo);
	}//modify

	@Override
	public int remove(Integer bcno) {
		log.debug(" >> remove({}) invoked.", bcno);
		Objects.requireNonNull(this.mapper);
		BoardCommentVO vo = this.mapper.read(bcno);
		this.bmapper.commentCnt(vo.getBno(), -1);
		
		return this.mapper.delete(bcno);
	}//remove

}//end class