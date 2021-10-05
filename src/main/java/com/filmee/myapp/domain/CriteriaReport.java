package com.filmee.myapp.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor
@Data
public class CriteriaReport {
	
	//Pagination
	private int currPage=1;	
	private int amount=10;
 	private int pagesPerPage=5;

 	public String getPagingUri() { 
 		log.debug("getPagingUri() invoked.");
 		
 		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("");
 		builder.queryParam("currPage", this.currPage);	//현재페이지
 		builder.queryParam("amound", this.amount);		//보여줄게시물수
 		builder.queryParam("pagesPerPage", this.pagesPerPage);	//보여줄 페이지 수
 		
 		return builder.toUriString();
 	}//getPagingUri
}//end class
