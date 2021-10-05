package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewDTO {
	
	private Integer rno;
	private Integer film_id;
	private Integer writer; // == fm_user의 user_id 
	private Double rate;
	private String content;
	private Timestamp insert_ts;
	private Timestamp update_ts;
	private Timestamp delete_ts;
//	private Timestamp watched_date;
//	private Character is_spoiled;
	private Integer like_cnt;
	


} // end class
