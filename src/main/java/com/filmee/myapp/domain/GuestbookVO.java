package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;


@Value
public class GuestbookVO {
	
	private Integer gno;
	private Integer owner;
	private Integer writer;
	private String nickname;
	private String content;
	private Timestamp insertTs;
	private Timestamp updateTs;

} //end class
