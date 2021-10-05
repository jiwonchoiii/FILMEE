package com.filmee.myapp.domain;

import java.util.List;

import lombok.Data;

@Data
public class BoardPageDTO {
	//for pagination
	private Criteria cri;
	private int totalAmount;	//전체 게시물 수
	
	private int endPage;	//현재 페이지에서 보여줄 끝 페이지 번호
	private int startPage;	//시작 페이지 번호
	private int realEndPage;//제일 끝 페이지 번호
	private int offset;		//현재 페이지의 시작 게시물의 인덱스 번호
	
	private boolean prev; 	//이전 페이지로 갈 수 있는지 여부
	private boolean next; 	//다음 페이지로 갈 수 있는지 여부
	
	private int replyCnt;
	private List<BoardCommentVO> list;
	
	public BoardPageDTO(int replyCnt, List<BoardCommentVO> list) {
		this.replyCnt=replyCnt;
		this.list=list;
	}
	
	public BoardPageDTO(Criteria cri, int totalAmount) {
		this.cri=cri;
		this.totalAmount=totalAmount; 
		
		
		//----------------------------------------------------------//
		//--Step.1 : 페이징 처리를 위한 공통변수 생성하기
		//----------------------------------------------------------//
		int currPage = cri.getCurrPage();		//출력시킬 현재 페이지 번호 추출 from criteria
		int amount = cri.getAmount();			//한 페이지 당 보여줄 레코드 건수추출 from Criteria
		int pagesPerPage = cri.getPagesPerPage();//각 페이지 아래에 보여줄 페이지 번호의 개수 추출 from Criteria	

      	//----------------------------------------------------------//
		//--Step.2 : 현재 페이지에서 보여줄 페이지목록의 끝페이지번호 구하기
		//----------------------------------------------------------//
		// (공식) 끝페이지번호 = (int) Math.ceil( (double) 현재페이지번호 / 페이지목록길이 ) x 페이지목록길이
		//----------------------------------------------------------//
		this.endPage = (int) Math.ceil( (currPage * 1.0) / pagesPerPage ) * pagesPerPage;

		//----------------------------------------------------------//
		//--Step.3 : 현재 페이지의 페이지번호목록의 시작번호 구하기
		//----------------------------------------------------------//
		// (공식) 시작페이지번호 = 끝페이지번호 - ( 페이지목록길이 - 1 )
		//----------------------------------------------------------//
		this.startPage = this.endPage - ( pagesPerPage - 1 );

		//----------------------------------------------------------//
		//--Step.4 : 총페이지수 구하기
		//----------------------------------------------------------//
		// (공식) 총페이지수 = (int) Math.ceil( (double) 모든행의개수 / 한페이지당행의수 )
		//----------------------------------------------------------//
		this.realEndPage = (int) Math.ceil( (totalAmount * 1.0) / amount );
      
		if(this.realEndPage < this.endPage) {
			this.endPage = this.realEndPage;
		} // if

		//----------------------------------------------------------//
		//--Step.5 : 이전 페이지번호목록으로 이동가능여부(prev) 구하기
		//----------------------------------------------------------//
		// (공식) 이전페이지목록이동가능여부 = 시작페이지번호 > 1
		//----------------------------------------------------------//
		this.prev = this.startPage > 1;

		//----------------------------------------------------------//
		//--Step.6 : 다음 페이지번호목록으로 이동가능여부(next) 구하기
		//----------------------------------------------------------//
		// (공식) 다음페이지목록이동가능여부 = 끝페이지번호 < 총페이지수
		//----------------------------------------------------------//
		this.next = this.endPage < realEndPage;

		//----------------------------------------------------------//
		//--Step.7 : 현재 페이지에 표시할 목록의 시작 offset 구하기
		//----------------------------------------------------------//
		// (공식) 시작 offset = (현재페이지번호 - 1) x 한페이지당행의수
		//----------------------------------------------------------//
		this.offset = ( currPage - 1 ) * amount;

	}
	
}//end class
