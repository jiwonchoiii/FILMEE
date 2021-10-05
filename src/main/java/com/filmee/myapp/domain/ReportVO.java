package com.filmee.myapp.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReportVO {

	private Integer rptno;			//신고번호
	private String code;			//신고유형 1:욕설,비방/2.스포일러/3.광고성글/4.기타
	private Integer accuser;		//신고자ID
	private String target_type;		//신고항목타입 RNO,RCNO,BNO,BCNO
	private Integer target;			//신고항목 ID
	private Integer suspect;		//신고대상자ID
	private String content;			//내용
	private Date insert_ts;			//신고일
	private Date check_ts;			//신고확인일
	private Date complete_ts;		//처리일
	private Integer mgr_id;			//처리관리자ID
	private String nickname;		//처리관리자닉네임
	private Integer sus_period;		//활동정지기간
	
}