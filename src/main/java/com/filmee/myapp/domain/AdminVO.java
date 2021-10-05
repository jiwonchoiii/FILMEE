package com.filmee.myapp.domain;

import lombok.Value;


@Value
public class AdminVO {
	
	//관리자 게시판 메인의 Total에 사용할 VO
	private Integer countbno;	//게시글수
	private Integer countrno;	//리뷰수
	private Integer countrptno;	//신고수
	private Integer compno; //요청수
	private Integer useridno;//회원가입수

}
