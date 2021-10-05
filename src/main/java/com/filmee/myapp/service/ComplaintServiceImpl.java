package com.filmee.myapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.ComCriteria;
import com.filmee.myapp.domain.ComplaintVO;
import com.filmee.myapp.mapper.ComplaintMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor// 생성자를 통한 의존성주입

@Service
public class ComplaintServiceImpl 
	implements ComplaintService{

	//매개변수가 하나라 자동으로 주입
	@Setter(onMethod_=@Autowired)
	private ComplaintMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private MailSendService mailService;


	
//		@Override
//		public void afterPropertiesSet() throws Exception {		
//		      log.debug("afterPropertiesSet() invoked.");
//			
//		      Objects.requireNonNull(this.mapper); 
//		      log.info("\t+ service: {} ",this.mapper);
//		      
//		}//afterPropertiesSet
//	
//	
//		@Override
//		public void destroy() throws Exception {
//		      log.debug("destroy() invoked.");
//			
//		}//destroy
	

		@Override
	   public boolean register(ComplaintVO complaint){
	      log.debug("register({}) invoked.", complaint);
	      
	      Objects.requireNonNull(this.mapper);
	      
	      int affectedLines = mapper.insert(complaint);

	      return (affectedLines == 1);
	      }//register


		@Override
		public List<ComplaintVO> getList() {
		      log.debug("getList() invoked.");
		       
		      Objects.requireNonNull(this.mapper);
			return mapper.getList();
		}//getList

		
		@Override
		public List<ComplaintVO> getListPerPage(ComCriteria cri) {
		     log.debug("getListPerPage({}) invoked.",cri);
			
		     log.info("\t+ cri:{}",cri);
		     
		      return this.mapper.getListWithPaging(cri);
		}//getListPerPage

	
		@Override
		public boolean temporaryUpdate(ComplaintVO complaint) {
		      log.debug("temporary({}) invoked.",complaint);
		      
		      Objects.requireNonNull(this.mapper);
		      
		      log.info("content_re :{}", complaint.getContent_re());
		      log.info("content_re.type :{}", complaint.getContent_re().getClass().getName());
		      
			  ComplaintVO complaintToCheck = this.mapper.select(complaint.getCompno());

		      if(complaintToCheck.getComplete_ts()!=null) {	//요청처리가 되어있었다면.
					log.info("==================================================================");
					log.info("\t+complaint.getComplete_ts(): {}",complaintToCheck.getComplete_ts());
					log.info("==================================================================");
					return false;
				}
		      
			return (this.mapper.update(complaint)==1);
		}

		
		@Override
		public boolean completion(ComplaintVO complaint) {
		      log.debug("completion({},{}) invoked.",complaint);

			   Objects.requireNonNull(this.mapper);
			   
			   ComplaintVO complaintToCheck = this.mapper.select(complaint.getCompno());	//compno,content,content_re,getComplete_ts를 db에서 가져오기
			   
				if(complaintToCheck.getComplete_ts()!=null || complaintToCheck.getContent_re() == null) {	//요청처리가 되어있었다면.
					log.info("==================================================================");
					log.info("\t+complaint.getComplete_ts(): {}",complaintToCheck.getComplete_ts());
					log.info("==================================================================");
					return false;
				}

			   String email = this.mapper.userEmail(complaint.getCompno());
				log.info("===================================================");
				log.info("\t+email:{}",email);
				log.info("\t+content:{}",complaintToCheck.getContent());
				log.info("\t+content:{}",complaint.getContent_re());
				log.info("===================================================");
				if(complaintToCheck.getSend() == 1) {
					this.mailService.sendComplaintMail(email, complaintToCheck.getContent().replaceAll("\r\n","<br>"),complaint.getContent_re().replaceAll("\r\n","<br>"));
				}

			return (this.mapper.updateEnd(complaint)==1);
		}//completion

		
		@Override
		public ComplaintVO get(Integer compno) {
		      log.debug("get({}) invoked.",compno);
		      
			   Objects.requireNonNull(this.mapper);
			   ComplaintVO complaintRead=this.mapper.select(compno);
			return complaintRead;
		}//get

		
		@Override
		public int getTotal(ComCriteria cri) {
			log.debug("getTotal({} invoked.", cri);
			
			log.info("\t+ cri : {}", cri);
			
			Objects.requireNonNull(this.mapper);
			
			return this.mapper.getTotalCount(cri);
		}


}
