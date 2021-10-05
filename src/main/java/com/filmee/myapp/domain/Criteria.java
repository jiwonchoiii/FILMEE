package com.filmee.myapp.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor
@Data
public class Criteria {
	
	//Pagination
	private int currPage=1;	//현재 페이지
	private int amount=20;	//현재 페이지에 보여줄 게시물 개수
 	private int pagesPerPage=5;//보여줄 페이지 수
 	
 	//Search
 	private String type;	//검색유형
 	private String keyword;	//검색어
 	
 	//CategorySelect
 	private String category;//카테고리선택

 	
 	public String getPagingUri() { 
 		log.debug("getPagingUri() invoked.");
 		
 		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("");
 		builder.queryParam("category", this.category);	//선택할 카테고리
 		builder.queryParam("currPage", this.currPage);	//현재페이지
 		builder.queryParam("amound", this.amount);		//보여줄게시물수
 		builder.queryParam("pagesPerPage", this.pagesPerPage);	//보여줄 페이지 수
 		builder.queryParam("type", this.type);		//검색유형
 		builder.queryParam("keyword", this.keyword);
 		
 		return builder.toUriString();
 	}//getPagingUri
}//end class
