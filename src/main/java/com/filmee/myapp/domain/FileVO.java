package com.filmee.myapp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FileVO {
	
	private Integer fno;
	private Integer bno;
	private String fname;
	private String uuid;
	private String mime;
	private String path;
	private Date insert_ts;
	private Date delete_ts;

}//end class
