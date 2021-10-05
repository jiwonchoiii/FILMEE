package com.filmee.myapp.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.log4j.Log4j2;

// 페이징 처리를 위해, 기준값을 저장하는 용도의 클래스
// 그리고 이 기준 클래스를 앞으로만들 DTO 클래스에서 사용하자!!!

@Log4j2
@Data

public class CriteriaFilmReview {

	private int currPage = 1; // 현재 보고자 하는 페이지 번호
	private int amount = 10; // 한 페이지당 보여줄 레코드 건수
	private int pagesPerPage = 5; // 각 페이지 아래에 보여줄 페이지번호의 갯수

	private Integer film_id;

	public String getPagingUri() {
		log.debug("getPagingUri() invoked.");

		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("");

		builder.queryParam("currPage", this.currPage);
		builder.queryParam("amount", this.amount);
		builder.queryParam("pagesPerPage", this.pagesPerPage);
		builder.queryParam("film_id", this.film_id);

		log.info("\t+ pagingUri: " + builder.toUriString());

		return builder.toUriString();
	} // getPagingUri
	
	
	public CriteriaFilmReview(Integer film_id) {
		this.film_id=film_id;
	} // constructor

} // end class