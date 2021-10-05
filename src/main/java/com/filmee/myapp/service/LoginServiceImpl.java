package com.filmee.myapp.service;

import java.util.Date;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.UserDTO;
import com.filmee.myapp.domain.UserVO;
import com.filmee.myapp.mapper.LoginMapper;
import com.filmee.myapp.util.HashUtils;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class LoginServiceImpl 
	implements LoginService, InitializingBean {

	@Setter(onMethod_=@Autowired)
	private HashUtils hashUtils;
	
	@Setter(onMethod_=@Autowired)
	private MailSendService mailService;

	@Setter(onMethod_=@Autowired)
	private LoginMapper mapper;

	@Override
	public void afterPropertiesSet() throws Exception {
		log.debug("afterPropertiesSet() invoked.");
		
		Objects.requireNonNull(this.hashUtils);
		Objects.requireNonNull(this.mailService);
		Objects.requireNonNull(this.mapper);
	}//afterPropertiesSet
	
	
	@Override
	public UserVO login(UserDTO dto) throws Exception {
		log.debug("login({}) invoked.", dto);
		
		UserVO user = null;
		
		if(dto.getEmail().contains("SOC.KAKAO_")) {
			user = this.mapper.selectUserBySocialEmail(dto.getEmail());
						
		}else {
			//DB에 저장된 회원의 salt를 가져와 비밀번호와 함께 hashing
			String salt = this.getUserSalt(dto.getEmail());		//DB에 저장된 유저의 salt 획득
			String hashedPw = hashUtils.hashing(dto.getPassword(), salt);	//유저가 입력한 비밀번호와 salt를 함께 hashing
			
			dto.setPassword(hashedPw);	//dto 비밀번호 저장
			
			user = this.mapper.selectUser(dto);
			
		}//if-else
		
		log.info("user : {}", user);

		return user;
	}//login

	@Override
	public String getUserSalt(String email) throws Exception {
		log.debug("getUserSalt({}) invoked.", email);
		
		String salt = this.mapper.selectSaltWithEmail(email);
		
		log.info("salt : {}", salt);
		
		return salt;
	}//getUserSalt
	

	@Override
	public int setUserRememberMe(
			String email, String rememberCookie, Date rememberAge
			) throws Exception {
		log.debug("setUserRememberMe({}, {}, {}) invoked.", email, rememberCookie, rememberAge);
		
		int affectedLines = this.mapper.updateUserRememberMe(email, rememberCookie, rememberAge);

		return affectedLines;

	}//setUserRememberMe


	@Override
	public UserVO findUserWithCookie(String cookieValue) throws Exception {
		log.debug("findUserWithCookie({}) invoked.", cookieValue);
		
		UserVO user = this.mapper.selectUserWithCookie(cookieValue);
		
		log.info("user : {}", user);

		return user;
	}//findUserWithCookie


	@Override
	public int changePassword(UserDTO dto) throws Exception {
		log.debug("changePassword({}) invoked.", dto);
		
		String salt = hashUtils.getSalt();	//보안을 위해 비밀번호 변경시 유저의 salt도 같이 변경
		String password = dto.getPassword();
		
		boolean isFromForgotPw = false;		//true : 비밀번호 변경 / false : 비밀번호 찾기
		
		if(password == null) {				//비밀번호 찾기에서 요청이 들어온 경우 dto에 password 값이 없다.		
			isFromForgotPw =true;
			password = this.mailService.getRandomCode(MailSendService.TEMP_PW);	//임시 비밀번호 생성
		}//if
		
		String hashedPw = hashUtils.hashing(password, salt);		//임시 비밀번호와 salt를 함께 hashing
		
		dto.setPassword(hashedPw);	//dto에 비밀번호와 salt를 저장
		dto.setSalt(salt);
				
		if(this.mapper.updatePassword(dto) == 1) {	//임시비밀번호가 DB에 성공적으로 저장됐으면
			if(isFromForgotPw) {	//비밀번호 찾기 요청이었을 경우
				this.mailService.sendTempPwMail(dto.getEmail(),password);	//이메일로 임시 비밀번호 발송

				return 1;
			} else {	//비밀번호 변경 요청이었을 경우
				return 2;
			}//if-else
		}else {			//DB 저장에 실패했다면
			return 3;
		}//if-else
		
	}//modifyPwToTempPw
	
}//end class