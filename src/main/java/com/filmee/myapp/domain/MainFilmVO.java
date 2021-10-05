package com.filmee.myapp.domain;

import lombok.Value;


@Value
public class MainFilmVO {
	
	private Integer filmid;
	private String poster;
	private String title;
	private String year;

} //end class