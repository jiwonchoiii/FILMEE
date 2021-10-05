package com.filmee.myapp.domain;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class ComPageDTO {

	//아래 두개의 필드는 페이징 처리에 필요한 방정식의 "상수"를 저장
	private ComCriteria cri;
	private int totalAmount;		// 총 레코드 수
	
	//위의 상수들에 기반하여, 공식대로 페이징처리에 필요한 변수값을 계산/저장
	private int endPage;		//단순 형식적인 끝 페이지 번호
	private int startPage;		
	private int realEndPage;	//총 레코드 건수에 기반한 실제 마지막 페이지 번호
	private int offset;			//현재 페이지의 시작 레코드 인덱스 번호
	
	private boolean prev;
	private boolean next;
	
	public ComPageDTO(ComCriteria cri, int totalAmount) {
		this.cri = cri;
		
		this.totalAmount=totalAmount;
		
		//=====================================================
		//--Step 0 : 페이징 처리를 위한 공통변수 생성하기
		//=====================================================
		int currPage = cri.getCurrPage();			//출력시킬 현재 페이지 번호 추출 from Criteria
		int amount = cri.getAmount();				 
		int pagesPerPage = cri.getPagesPerPage();
		
		//=====================================================
		//--Step 1 : 현재 페이지에서 보여줄 페이지 목록의 끝 페이지번호 구하기
		//=====================================================
		//(공식) 끝페이지번호 = (int) Math.ceil( (double)현재페이지번호/페이지목록길이 ) * 페이지목록길이
		//=====================================================
		this.endPage = (int) Math.ceil( (currPage * 1.0) / pagesPerPage ) * pagesPerPage;
		
		//=====================================================
		//--Step 2 : 현재 페이지의 페이지번호 목록의 시작번호 구하기
		//=====================================================
		//(공식) 시작페이지번호 = 끝페이지번호 - (페이지목록길이 - 1)
		//=====================================================
		this.startPage = this.endPage - ( pagesPerPage - 1 );
		
		
		//=====================================================
		//--Step 3 : 총 페이지수 구하기
		//=====================================================
		//(공식) 총페이지수 = (int) Math.ceil( (double) 모든 행의 개수 / 한페이지당 행의 수)
		//=====================================================
		this.realEndPage = (int) Math.ceil( (totalAmount * 1.0) / amount);
		
		if(this.realEndPage < this.endPage) {
			this.endPage = this.realEndPage;
		}//if
		
		//=====================================================
		//--Step 4 : 이전 페이지 번호 목록으로 이동가능 여부(prev) 구하기
		//=====================================================
		//(공식) 이전 페이지 목록 이동 가능 여부 = 시작 페이지 번호 > 1
		//=====================================================
		this.prev = this.startPage > 1;
		
		//=====================================================
		//--Step 5 : 다음 페이지 번호 목록으로 이동가능 여부(next) 구하기
		//=====================================================
		//(공식) 다음 페이지 목록 이동 가능 여부 = 끝페이지번호 < 총페이지수
		//=====================================================
		this.next = this.endPage < realEndPage;
		
		//=====================================================
		//--Step 6 : 현재 페이지에 표시할 목록의 시작 offset 구하기
		//=====================================================
		//(공식) 시작 offset = (현재페이지번호 - 1) * 한페이지당 행의 수
		//=====================================================
		this.offset = (currPage - 1) * amount;
			
	}//constructor
	
}//end class
