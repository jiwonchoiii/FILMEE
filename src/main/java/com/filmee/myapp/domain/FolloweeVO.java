package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;


@Value
public class FolloweeVO {
	
	private Integer userid;
	private String nickname;
	private Integer follower;
	private String photo;
	private Timestamp insertTs;

} //end class
