package com.filmee.myapp.domain;

import lombok.Data;

@Data
public class PunishDTO {

	private Integer mgrId;		//처리 관리자
	private Integer rptno;		//신고번호
	private Integer suspect;	//신고대상자
	private Integer susPeriod;		//정지기간
	
}//end class