package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;


@Value
public class FilmPeopleVO {
	
	private String enname; // DB상에는 People테이블에 있는 칼럼인데 조인결과때문에 추가 
	private Integer film_id;
	private Integer people_id;
	private Integer credit_order;
	private String character;
	private Timestamp insert_ts;
	private Timestamp update_ts;
	
} // end class
