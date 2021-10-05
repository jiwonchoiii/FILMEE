package com.filmee.myapp.domain;

import java.sql.Timestamp;

import lombok.Value;

@Value
public class UserVO {
	
			private Integer userId;
			private String email;
//	private String password;
			private String nickname;
			private String isAdmin;
	private Timestamp joinTs;
	private Timestamp deleteTs;
			private String profileText;
			private String profilePhotoPath;
			private Timestamp susFrom;
			private Timestamp susTo;
//	private String susReason;
//	private String RememberCookie;
//	private Timestamp rememberAge;
			private String authCode;
			
}//end class