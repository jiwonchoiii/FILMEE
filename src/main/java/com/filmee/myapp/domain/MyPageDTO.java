package com.filmee.myapp.domain;

import lombok.Getter;
import lombok.ToString;


@Getter
@ToString
public class MyPageDTO {
	
	private CriteriaGuestbook criG;
	private CriteriaActivity criA;
	private CriteriaFilm criFilm;
	private CriteriaReview criR;
	private CriteriaFollow criF;
	
	private int totalAmount;
	
	private int endPage;
	private int startPage;
	private int realEndPage;
	private int offset;
	
	private boolean prev;
	private boolean next;
	
	public MyPageDTO(CriteriaFilm criFilm, int totalAmount) {
		
		this.criFilm = criFilm;
		
		int currPage = criFilm.getCurrPage();
		int amount = criFilm.getAmount();
		int pagesPerPage = criFilm.getPagesPerPage();
		
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
	
	public MyPageDTO(CriteriaFollow criF, int totalAmount) {
		
		this.criF = criF;
		
		int currPage = criF.getCurrPage();
		int amount = criF.getAmount();
		int pagesPerPage = criF.getPagesPerPage();
		
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
	
	public MyPageDTO(CriteriaReview criR, int totalAmount) {
		
		this.criR = criR;
		
		int currPage = criR.getCurrPage();
		int amount = criR.getAmount();
		int pagesPerPage = criR.getPagesPerPage();
		
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
	
	public MyPageDTO(CriteriaActivity criA, int totalAmount) {
		
		this.criA = criA;
		
		int currPage = criA.getCurrPage();
		int amount = criA.getAmount();
		int pagesPerPage = criA.getPagesPerPage();
		
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
	
	public MyPageDTO(CriteriaGuestbook criG, int totalAmount) {
		
		this.criG = criG;
		
		int currPage = criG.getCurrPage();
		int amount = criG.getAmount();
		int pagesPerPage = criG.getPagesPerPage();
		
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
