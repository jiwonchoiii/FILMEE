package com.filmee.myapp.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewHeartVO {
	
	private Integer hno;
	private Integer userId;
	private Integer rno;
	private Integer likecheck;
}