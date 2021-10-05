package com.filmee.myapp.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.extern.log4j.Log4j2;


@Log4j2
@Data
public class CriteriaFilm {
	
	private int userid;
	private int code;
	private int currPage = 1;
	private int amount = 5;
	private int pagesPerPage = 5;	
	
	public String getPagingUri() {
		log.debug("getPagingUri() invoked.");
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("");
		
		builder.queryParam("userid", this.userid);
		builder.queryParam("code", this.code);
		builder.queryParam("currPage", this.currPage);
		builder.queryParam("amount", this.amount);
		builder.queryParam("pagesPerPage", this.pagesPerPage);
		
		log.info("\t+ pagingUri : {}", builder.toUriString());
		
		return builder.toUriString();		
	} //getPagingUri

} //end class
