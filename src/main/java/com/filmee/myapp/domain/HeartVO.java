package com.filmee.myapp.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HeartVO {
	
	private Integer hno;
	private Integer userid;
	private Integer bno;
	private Integer likecheck;
}