package com.filmee.myapp.domain;

import lombok.Getter;
import lombok.ToString;


@Getter
@ToString
public class SearchPageDTO {
		
	private CriteriaSearch cri;
	
	private int totalAmount;
	
	private int endPage;
	private int startPage;
	private int realEndPage;
	private int offset;
	
	private boolean prev;
	private boolean next;
	
	public SearchPageDTO(CriteriaSearch cri, int totalAmount) {
		
		this.cri = cri;
		
		int currPage = cri.getCurrPage();
		int amount = cri.getAmount();
		int pagesPerPage = cri.getPagesPerPage();
		
		this.totalAmount = totalAmount;
		
		this.endPage = (int) Math.ceil((currPage * 1.0) / pagesPerPage) * pagesPerPage ;
		this.startPage = this.endPage - (pagesPerPage - 1);
		
		this.realEndPage = (int) Math.ceil((totalAmount * 1.0) / amount);
		
		if(this.endPage > this.realEndPage) {
			this.endPage = this.realEndPage;
		} //if
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < this.realEndPage;
		
		this.offset = (currPage - 1) * amount;
		
	} //constructor

} //end class
