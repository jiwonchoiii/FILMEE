package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;

@Value
public class SearchPeopleVO {
	
	private String enname;
	private String profilePath;
	private Integer creditOrder;
	private String character;
	private Integer filmId; 
	private String originalTitle;
	private String releaseDate;
	private Double popularity;
	private String posterPath; 
						
}//end class
