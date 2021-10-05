package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.FileVO;

public interface FileMapper {
	
	public abstract int insert(FileVO vo);			//파일 업로드
	
	public abstract void delete(String uuid);		//업로드된 파일 삭제
	
	public abstract FileVO find(Integer bno);	//게시글 번호에 맞는 파일리스트 가져오기

}//end interface
