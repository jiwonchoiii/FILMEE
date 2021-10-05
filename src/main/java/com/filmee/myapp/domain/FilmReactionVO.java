package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;


@Value
public class FilmReactionVO {

	private Integer filmid;
	private String title;
	private String poster;
	private String plot;
	private Integer code;
	private Integer userid;
	private Timestamp insertTs;

} //end class
