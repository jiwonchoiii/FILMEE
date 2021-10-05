package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;


@Value
public class MainReviewVO {
	
	private Integer filmid;
	private Integer rno;
	private String poster;
	private String content;
	private Double rate;
	private String title;
	private Integer width;
	private Timestamp insertTs;

} //end class