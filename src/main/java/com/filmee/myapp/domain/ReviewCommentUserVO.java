package com.filmee.myapp.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewCommentUserVO {
	
	private Integer rcno;
	private Integer rno;
	private Integer writer;
	private String content;
	private Date insert_ts;
	private Date update_ts;
	private Integer parent_rcno;
	
	//user
	private Integer user_id;
	private String nickname;

}//end class
