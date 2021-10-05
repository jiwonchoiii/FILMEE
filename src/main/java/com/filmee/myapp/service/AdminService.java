package com.filmee.myapp.service;

import com.filmee.myapp.domain.AdminVO;

public interface AdminService {
	
	//관리자 메인에서 사용할 신규 건수
	public abstract AdminVO totalCount();

}
