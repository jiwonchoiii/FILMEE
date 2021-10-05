package com.filmee.myapp.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.BoardUserVO;
import com.filmee.myapp.domain.BoardVO;
import com.filmee.myapp.domain.Criteria;
import com.filmee.myapp.domain.FileVO;
import com.filmee.myapp.mapper.BoardMapper;
import com.filmee.myapp.mapper.FileMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class BoardServiceImpl 
	implements BoardService {
	
	@Autowired private BoardMapper mapper;
	@Autowired private FileMapper fmapper; 


	@Override
	public List<BoardUserVO> getList(Criteria cri) {
		log.debug("getList({},{}) invoked.",cri);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getList(cri);
	}//getList

	@Override
	public BoardUserVO get(Integer bno) {
		log.debug("get({}) invoked.",bno);
		Objects.requireNonNull(this.mapper);
		this.mapper.viewCnt(bno, 1);
		
		return this.mapper.select(bno);
	}//get

	@Override
	public boolean register(BoardVO board) {
		log.debug("register({},{}) invoked.",board);
		Objects.requireNonNull(mapper);
		Objects.requireNonNull(fmapper);
		
		return (this.mapper.insertSelectKey(board)==1);
	}//register

	@Override
	public boolean modify(BoardVO board) {
		log.debug("modify({}) invoked.",board);
		Objects.requireNonNull(this.mapper);

		return (this.mapper.update(board)==1);
	}//modify

	@Override
	public boolean remove(Integer bno) {
		log.debug("remove({}) invoked.",bno);
		Objects.requireNonNull(this.mapper);

		return (this.mapper.delete(bno)==1);
	}//remove
 
	@Override
	public int getTotal(Criteria cri) { 
		log.debug("getTotal({}) invoked.",cri);
		Objects.requireNonNull(this.mapper);
		Objects.requireNonNull(cri);
		
		return this.mapper.getTotalCount(cri);
	}//getTotal

	//---- FILE ----//
	
	@Override
	public int fileInsert(FileVO file) {
		log.debug("fileInsert({}) invoked.",file);
		Objects.requireNonNull(this.fmapper);
		
		int affectedLines = this.fmapper.insert(file);
		return affectedLines;
	}//fileInsert

	@Override
	public FileVO fileDetail(Integer bno) {
		log.debug("fileDetail({}) invoked.", bno);
		Objects.requireNonNull(this.fmapper);
		
		FileVO list = this.fmapper.find(bno);
		
		return list;
	}
	


}//end class