package com.filmee.myapp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.filmee.myapp.domain.FilmeeFilmsVO;
import com.filmee.myapp.domain.FilmeeReviewsVO;
import com.filmee.myapp.domain.UserDTO;
import com.filmee.myapp.domain.UserVO;
import com.filmee.myapp.service.JoinService;
import com.filmee.myapp.service.LoginService;
import com.filmee.myapp.service.MainService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor


@RequestMapping("/main")
@Controller
public class MainController {
		
	public static final String loginKey = "__LOGIN__";
	public static final String rememberMeKey = "__REMEMBER_ME__"; 
	
	@Setter(onMethod_=@Autowired)
	private LoginService loginService;
	
	@Setter(onMethod_=@Autowired)
	private JoinService joinService;
	
	@Autowired
	private MainService mainService;

	//View-Controller : main, loginRequired, forgotPw
	
	
	@GetMapping("")
	public String main(Model model) {
		log.debug("main({}) invoked", model);
		
		List<FilmeeFilmsVO> films = this.mainService.getMainFilms();
		List<FilmeeReviewsVO> reviews = this.mainService.getMainReviews();
		
		model.addAttribute("films", films);
		model.addAttribute("reviews", reviews);		
		
		return "main/main";
	} //main
	
	//====== 로그인 관련 ======
	
	//header.jsp의 로그아웃을 누를시
	@GetMapping("/logout")
	public String logout() {
		log.debug("logout() invoked.");

		return "redirect:/main";	//Interceptor에서 세션 비활성화 및 RememberMe 쿠키 삭제 후 메인으로 Redirect
	}
	

	//login modal에서 sign in 버튼 클릭 시
	@ResponseBody
	@PostMapping("/loginPost")
	public Map<String, String> loginPost(UserDTO dto, HttpSession session) throws Exception {
		log.debug("loginPost({}, model, {}) invoked.", dto, session);
			
		UserVO user = this.loginService.login(dto);		//회원 정보 확인
		log.info("user : {}", user);
				
		Map<String, String> resultMap = new HashMap<>();
			
		if(user == null) {		//로그인 정보가 없다면
			log.info("return 1");
			resultMap.put("loginNum", "1");
								
		} else if( !user.getAuthCode().equals("authorized") ) {	//이메일 인증을 하지 않은 유저가 로그인을 시도했다면
			log.info("return 2");
			resultMap.put("loginNum", "2");
			
		} else if( user.getSusTo() != null && user.getSusTo().after(new Date()) ) {	//활동정지일이 현재 시간보다 뒤라면
			log.info("return 3");
			resultMap.put("loginNum", "3");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
			
			resultMap.put("susTo", sdf.format(user.getSusTo()).toString());
			
		} else {	//이메일 인증까지 마친 유저가 로그인을 시도했다면
			log.info("return 4");

			session.setAttribute(MainController.loginKey, user);
			log.info(">>>>> LoginKey added on SessionScope. >>>>>");

			if(dto.isRememberMe()) {	//자동로그인 체크 했으면 DB에 쿠키정보 저장
				String rememberCookie = session.getId();
				
				String email = dto.getEmail();
				
				Date rememberAge = new Date(System.currentTimeMillis() + (1000*60*60*24*7) );	//유효기간 7일
				
				//DB에 sessionId(RememberMe 쿠키의 값)와 유효기간(RememberMe 쿠키의 유효기간) 저장
				this.loginService.setUserRememberMe(email, rememberCookie, rememberAge);	
				
				resultMap.put("isRememberMe", "true");
				resultMap.put("cookieValue", rememberCookie);
				resultMap.put("rememberAge", rememberAge.toString());
				
			}//if(dto.isRememberMe())
			
			resultMap.put("loginNum", "4");
			
		}//if-elseIf-else
			
		return resultMap;
		//LoginInterceptor의 postHandle 메서드에서 이후 로직 처리(RememberMe 쿠키 생성 및 전송)
		
	}//loginPost
				
	//====== 회원가입 관련 ======
	
	//header.jsp의 join modal에서 이메일 중복검사 시
	@ResponseBody
	@GetMapping("/checkEmail")
	public Integer checkEmail(String email) throws Exception {
		log.debug("checkEmail({}) invoked.", email);
		
		int result = this.joinService.checkEmailDuplicated(email);
		log.info("result : {}", result);
		
		return result;
	}//checkEmail
	
	//header.jsp의 join modal에서 닉네임 중복검사 시
	@ResponseBody
	@GetMapping("/checkNickname")
	public Integer checkNickname(String nickname) throws Exception {
		log.debug("checkNickname({}) invoked.", nickname);
		
		int result = this.joinService.checkNicknameDuplicated(nickname);
		log.info("result : {}", result);
		
		return result;
	}//checkNickname
	

	//join modal에서 sign up 버튼 클릭 시 
	@PostMapping("/joinPost")
	public String joinPost(UserDTO dto, RedirectAttributes rttrs) throws Exception{
		log.debug("joinPost({}, rttrs, model) invoked.", dto);
		
		if( dto.getPassword() != null && dto.getPassword().equals("") ) {	//최초 소셜 로그인시
			if( this.joinService.joinBySocial(dto) == 1) {
				rttrs.addFlashAttribute("message", "social_join");
			} else {
				rttrs.addFlashAttribute("message", "task_failed");
			}//if-else
			
		}else {		//join modal에서 sign up했다면
			if( this.joinService.join(dto) == 1) {	// 정상 회원가입 처리됐다면
				rttrs.addFlashAttribute("message", "just_joinned");
			} else {								// 정상 회원가입에 실패했다면
				rttrs.addFlashAttribute("message", "task_failed");
			}//if-else
		}//if-else
				
		return "redirect:/main";	//메인으로 Redirect 후 메세지 띄움
	}//joinPost
	
	//인증 이메일에서 인증하기를 눌렀을 시
	@GetMapping("/emailAuthorized")
	public String emailAuthorized(String email, String authCode, RedirectAttributes rttrs) throws Exception {
		log.debug("emailAuthroized({}, {}) invoked.", email, authCode);
		
		if(this.joinService.isEmailAuthorized(email, authCode)) {	//DB에 저장된 유저의 인증키와 일치하면
			rttrs.addFlashAttribute("message", "join_complete");
		} else {													//유저의 인증키와 일치하지 않으면
			rttrs.addFlashAttribute("message", "task_failed");
		}//if-else	
		
		return "redirect:/main";	//메인으로 Redirect 후 메세지 띄움
	}//emailAuthroized
		
	@PostMapping("/deleteAccount")
	public String deleteAccount(Integer userId, RedirectAttributes rttrs) throws Exception{
		log.debug("deleteAccount({}) invoked.", userId);
		
		int result = this.joinService.deleteAccount(userId);
		
		if(result == 1) {
			rttrs.addFlashAttribute("message", "account_deleted");
		}else {
			rttrs.addFlashAttribute("message", "task_failed");			
		}//if-else
		
		return "redirect:/main";	//메인으로 Redirect 후 메세지 띄움

	}//deleteAccount
	
	
	
}//end class


