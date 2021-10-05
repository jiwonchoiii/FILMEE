package com.filmee.myapp.service;

import java.util.List;

import com.filmee.myapp.domain.BoardUserVO;
import com.filmee.myapp.domain.BoardVO;
import com.filmee.myapp.domain.Criteria;
import com.filmee.myapp.domain.FileVO;

public interface BoardService {
	//전체리스트, 한개 상세조회, 작성, 수정, 삭제
	public abstract List<BoardUserVO> getList(Criteria cri);//메인 list 조회 
	
	public abstract BoardUserVO get(Integer bno);		//상세조회
	
	public abstract boolean register(BoardVO board);//작성
	
	public abstract boolean modify(BoardVO board);	//수정
	
	public abstract boolean remove(Integer bno);	//삭제
	
	public abstract int getTotal(Criteria cri);		//전체 게시물 개수
	
	//파일첨부처리
	public abstract int fileInsert(FileVO file);	//파일업로드
	
	public abstract FileVO fileDetail(Integer bno);	//파일다운로드


}//end interface