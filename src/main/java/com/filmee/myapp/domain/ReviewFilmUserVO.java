package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;

@Value
public class ReviewFilmUserVO {
	
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
	
	
	// fm_film에서 필요한 칼럼
//	private Integer film_id;
	private String title;
	private String original_title;
	private Timestamp release_date;
	private String poster_path;
	
	// fm_user에서 필요한 칼럼 
	private String nickname;
	private String profile_photo_path;

} // end class