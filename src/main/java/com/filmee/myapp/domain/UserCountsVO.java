package com.filmee.myapp.domain;

import lombok.Value;

@Value
public class UserCountsVO {
		
	private Integer total;
	private Integer acc;
	private Integer acc_deleted;
	private Integer acc_suspended;

}//end class