package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;

@Value
public class PeopleVO {
	
	private Integer people_id;
	private String enname;
	private String koname;
	private String profile_path;
	private Timestamp insert_ts;
	private Timestamp update_ts;


} // end class 
