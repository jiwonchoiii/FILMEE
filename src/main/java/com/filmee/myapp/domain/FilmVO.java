package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;

@Value
public class FilmVO {
	
	private Integer film_id;
	private String title;
	private String original_title;
	private Timestamp release_date;
	private String country;
	private String plot;
	private Double popularity;
	private Integer runtime;
	private String poster_path;
	private String backdrop_path;
	private Timestamp insert_ts;
	private Timestamp update_ts;
	

} // class
