package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;


@Value
public class FilmeeReviewsVO {
	
	private Integer rno;
	private Integer filmid;
	private String nickname;
	private Double rate;
	private String content;
	private Timestamp insertTs;
	private Integer likeCnt;
	private Integer commentCnt;
	private String year;
	private String title;
	private String poster;
	private Double width;


} //end class
