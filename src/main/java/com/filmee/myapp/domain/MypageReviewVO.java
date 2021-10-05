package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;


@Value
public class MypageReviewVO {
	
	private Integer filmid;
	private Integer rno;
	private String poster;
	private String title;
	private Double rate;
	private Integer writer;
	private String content;
	private Double width;
	private Timestamp insertTs;

} //end class
