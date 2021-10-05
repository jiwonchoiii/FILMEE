package com.filmee.myapp.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.extern.log4j.Log4j2;


@Log4j2
@Data
public class CriteriaMain {
	
	private int userid;
	
	public String getPagingUri() {
		log.debug("getPagingUri() invoked.");
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("");
		
		builder.queryParam("userid", this.userid);		
		
		
		return builder.toUriString();		
	} //getPagingUri

} //end class
