package com.filmee.myapp.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardCommentVO {
	
	private Integer bcno;
	private Integer bno;
	private Integer writer;
	private String content;
	private Date insert_ts;
	private Date update_ts;
	private Integer like_cnt;
	private Integer parent_bcno;

}//end class
