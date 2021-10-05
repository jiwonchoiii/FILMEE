package com.filmee.myapp.domain;

import lombok.Data;


@Data
public class SearchFilmInfoVO {
	
	private Integer filmid;
	private String name;
	private String character;
	private Integer credit;
	private String photo;
	private Integer peopleid;

} //end class
