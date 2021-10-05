package com.filmee.myapp.mapper;

import com.filmee.myapp.domain.HeartVO;

public interface HeartMapper {
	
	public abstract int heartInsert(HeartVO vo);	//처음이라면 insert
	
	public abstract int heartCheck(Integer bno, Integer userid);	//좋아요를 눌렀을 때
	
	public abstract int heartUncheck(Integer bno, Integer userid);	//좋아요를 취소할 때
	
	public abstract HeartVO check(Integer bno, Integer userid); //좋아요 되어 있는지 확인
	
	public abstract int heartCnt(Integer bno);	//좋아요 개수
	
	
}//end interface
