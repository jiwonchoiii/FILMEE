package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;

@Value
public class ComplaintVO {
	
	private Integer compno;
	private Integer code;
	private Integer writer;
	private String content;
	private Timestamp insert_ts;
	private Timestamp check_ts;
	private Timestamp complete_ts;
	private	Integer mgr_id;
	private Integer send;
	private String content_re;
	
//	private String email;
	
}
