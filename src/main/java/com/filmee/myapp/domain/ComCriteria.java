package com.filmee.myapp.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Data
public class ComCriteria {
   
   private int currPage= 1 ;   //현재 보고자하는 페이지 번호
   private int amount = 10;   //한 페이지당 보여줄 게시물 개수
   private int pagesPerPage = 10; //페이지 아래에 보여줄 페이지 번호의 개수
   
	//Search
	private String type;	//검색유형
	private String keyword;	//검색어
	
	//CategorySelect
	private String category;//카테고리선택
   private String code;
   
   public String getPagingUri() {
      log.debug("getPagingUri() invoked");
      UriComponentsBuilder builder = UriComponentsBuilder.fromPath("");
      builder.queryParam("currPage", this.currPage);
      builder.queryParam("amount", this.amount);
      builder.queryParam("pagesPerPage", this.pagesPerPage);
      builder.queryParam("code", this.code);
      
      log.info("\t+ pagingUri:"+builder.toUriString());
      return builder.toUriString();
   }
}//end class