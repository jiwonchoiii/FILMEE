package com.filmee.myapp.domain;

import lombok.Value;


@Value
public class SearchFilmVO {
	
	private Integer filmid;
	private String title;
	private String poster;
	private String plot;
	private String year;
	private String country;
	private Integer runtime;
	

} //end class