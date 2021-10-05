package com.filmee.myapp.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.filmee.myapp.domain.CriteriaReport;
import com.filmee.myapp.domain.PunishDTO;
import com.filmee.myapp.domain.ReportVO;
import com.filmee.myapp.mapper.ReportMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class ReportServiceImpl implements ReportService {

	@Setter(onMethod_=@Autowired)
	private ReportMapper mapper;
	
	@Autowired private MailSendService mailService;
	
	@Override
	public int reportRegister(ReportVO report) {
		log.debug(" SERVICE >> reportRegister({}) invoked.", report);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.newReport(report);
	}//repotrRegister

	@Override
	public List<ReportVO> getList(CriteriaReport cri) {
		log.debug(" SERVICE >> getList({}) invoked.", cri);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getList(cri);
	}//getList


	@Transactional	//두개의 DML문장을 트랜잭션처리
	@Override
	public int complete(PunishDTO dto) {
		log.debug(" SERVICE >> complete({}) invoked.", dto);
		Objects.requireNonNull(this.mapper);
		
		int aLine1 = this.mapper.complete(dto);
		int aLine2 = this.mapper.updateUserSus(dto);
		
		if((aLine1 == 1) && (aLine1 == aLine2)) {
			return 1;
		} else {
			return 2;
		}//if-else
				
	}//complete

	@Override
	public int getTotal(CriteriaReport cri) {
		log.debug(" SERVICE >> getTotal({}) invoked.", cri);
		Objects.requireNonNull(this.mapper);

		return this.mapper.getTotal(cri);
	}

}
