package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Data;


@Data
public class ReviewCommentVO {

	private Integer rcno; // 리뷰 댓글 번호
	private Integer rno; // 리뷰 번호
	private Integer writer; // 작성 회원id. fm_user 테이블의 user_id를 외래키로 받은 컬럼
	private String content; // 리뷰 내용
	private Timestamp insert_ts;
	private Timestamp update_ts;
	private Timestamp delete_ts;
	private Integer like_cnt; // 좋아요 수
	private Integer parent_rcno; // 부모 리뷰 댓글 번호
	
	
} // end class 
