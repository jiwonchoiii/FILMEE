package com.filmee.myapp.service;

import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.UserDTO;
import com.filmee.myapp.mapper.JoinMapper;
import com.filmee.myapp.util.HashUtils;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class JoinServiceImpl 
	implements JoinService, InitializingBean {
	
	@Setter(onMethod_=@Autowired)
	private HashUtils hashUtils;
	
	@Setter(onMethod_=@Autowired)
	private MailSendService mailService;

	@Setter(onMethod_=@Autowired)
	private JoinMapper mapper;
	
	
	@Override
	public void afterPropertiesSet() throws Exception {
		log.debug("afterPropertiesSet() invoked.");
		
		Objects.requireNonNull(this.hashUtils);
		Objects.requireNonNull(this.mailService);
		Objects.requireNonNull(this.mapper);
	}//afterPropertiesSet
	
	
	@Override
	public int join(UserDTO dto) throws Exception {
		log.debug("join({}) invoked.", dto);
				
		String salt = hashUtils.getSalt();		//유저 고유의 salt 생성
		String hashedPw = hashUtils.hashing(dto.getPassword(), salt);	//비밀번호와 salt를 함께 hashing
		
		String authCode = this.mailService.getRandomCode(MailSendService.EMAIL);	//인증키 생성
		
		this.mailService.sendAuthMail(dto.getEmail(), authCode);		//인증키가 포함된 인증 이메일 발송
		
		//dto에 hash 처리 된 비밀번호와 salt, 이메일 인증번호 저장 저장
		dto.setPassword(hashedPw);
		dto.setSalt(salt);
		dto.setAuthCode(authCode);
		
		int affectedLines = this.mapper.insertUser(dto);
		
		return affectedLines;
	}//join
	
	@Override
	public int joinBySocial(UserDTO dto) throws Exception {
		log.debug("joinBySocial({}) invoked.", dto);
		
		String randPw = this.mailService.getRandomCode(MailSendService.TEMP_PW);	//랜덤비밀번호 생성
		
		String salt = hashUtils.getSalt();		//유저 고유의 salt 생성
		String hashedPw = hashUtils.hashing(randPw, salt);	//비밀번호와 salt를 함께 hashing
		
		//dto에 hash 처리 된 비밀번호와 salt, 이메일 인증번호 저장 저장
		dto.setPassword(hashedPw);
		dto.setSalt(salt);
		dto.setAuthCode("authorized");
		
		int affectedLines = this.mapper.insertUser(dto);
		
		return affectedLines;
	}//joinBySocial


	@Override
	public int checkEmailDuplicated(String email) throws Exception {
		log.debug("checkEmailDuplicated({}) invoked.", email);
		
		int result = this.mapper.countUsersWithEmail(email);
		
		return result;
	}//checkEmailDuplicated
	
	@Override
	public int checkNicknameDuplicated(String nickname) throws Exception {
		log.debug("checkNicknameDuplicated({}) invoked.", nickname);
		
		int result = this.mapper.countUsersWithNickname(nickname);
		
		return result;
	}//checkNicknameDuplicated


	@Override
	public boolean isEmailAuthorized(String email, String authCode) throws Exception {
		log.debug("isEmailAuthorized({}, {}) invoked.", email, authCode);
		
		if(this.mapper.updateAuthCodeAuthorized(email, authCode) == 1) {
			return true;
		} else {
			return false;
		}//if-else
			
	}//isEmailAuthorized


	@Override
	public int deleteAccount(Integer userId) throws Exception {
		log.debug("deleteAccount({}) invoked.", userId);
		
		int affectedLines = this.mapper.updateUserAsDeleted(userId);
		
		log.info("affectedLines : {}", affectedLines);
		
		return affectedLines;
			
	}//deleteAccount


}//end class
