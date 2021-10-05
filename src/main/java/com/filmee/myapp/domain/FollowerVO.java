package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;


@Value
public class FollowerVO {
	
	private Integer follower;	
	private Integer userid;
	private String nickname;	
	private Integer followee;
	private String photo;
	private Timestamp insertTs;

} //end class
