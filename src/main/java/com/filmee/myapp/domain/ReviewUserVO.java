package com.filmee.myapp.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReviewUserVO {
	//Board
	private Integer rno;
	private Integer writer;
	private String content;
	private Date insert_ts;
	private Date update_ts;
	private Date delete_ts;
	private Integer like_cnt;	
	private Integer commentCnt;
	
	//User
	private Integer user_id;
	private String nickname;
	
}
