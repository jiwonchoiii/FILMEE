package com.filmee.myapp.interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.filmee.myapp.controller.MainController;
import com.filmee.myapp.domain.UserVO;
import com.filmee.myapp.service.LoginService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor
public class AuthInterceptor 
	implements HandlerInterceptor {

	@Setter(onMethod_= @Autowired)
	private LoginService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("preHandle(request, response, handler) invoked.");
	
		//Session Scope에서 로그인 정보 획득
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute(MainController.loginKey);
		
		//RememberMe 쿠키 획득
		Cookie rememberMeCookie = 
				WebUtils.getCookie(request, MainController.rememberMeKey);

		if(user != null) {	//로그인 정보가 있다면
			log.info(">>>>> Login Authenticated. >>>>>");
		
			return true;	 //요청을 그대로 컨트롤러로 전달
			
		} else if(rememberMeCookie != null) {	//로그인 정보는 없지만 RememberMe 쿠키가 있으면
			String rememberMe = rememberMeCookie.getValue();
			
			user = this.service.findUserWithCookie(rememberMe);
			
			if(user != null) {		//쿠키 정보와 일치하는 회원 정보가 있다면
				session.setAttribute(MainController.loginKey, user);	//Session Scope에 로그인 정보 추가
				
				log.info(">>>>> LoginKey added on SessionScope. >>>>>");

				//새로운 세션으로 접속 시 rememberMeCookie 갱신
				String sessionId = session.getId();		//현재 SessionId 획득
				
				this.service.setUserRememberMe(
						user.getEmail(),
						sessionId,
						new Date(System.currentTimeMillis() + (1000*60*60*24*7))	//유효기간 7일
						);
				
				rememberMeCookie = 
						new Cookie(MainController.rememberMeKey, sessionId);	//같은 이름의 새로운 쿠키 생성
				
				rememberMeCookie.setMaxAge(60*60*24*7);		//쿠키 유효기간 7일
				rememberMeCookie.setPath("/");				//쿠키 경로 : 모든 경로
				
				response.addCookie(rememberMeCookie);		//응답문서 새로 생성한 쿠키 추가
				log.info(">>>>> RememberMeCookie Renewed. >>>>>");
								
				return true;	//요청을 그대로 컨트롤러로 전달.
			}//if
			
		}else {	//로그인 정보도 없고 RememberMe 쿠키도 없다면
			//기존 URI & QueryString 획득
			String originalRequestURI = request.getRequestURI();
			String originalQueryString = request.getQueryString();

			originalRequestURI += 
					( (originalQueryString != null) && ( !(originalQueryString.equals("")) ) ?
							"?"+originalQueryString : "" );
			
			log.info("originalRequestURI : {}", originalRequestURI);
			
			//기존 URI를 값으로 하는 쿠키 생성
			Cookie uriCookie = 
					new Cookie("__ORIGINAL_REQUEST_URI__", originalRequestURI);
			
			uriCookie.setMaxAge(60);	//쿠키 유효기간 1분
			uriCookie.setPath("/");		//쿠키 경로 : 모든 경로
			
			response.addCookie(uriCookie);	//응답문서에 쿠키 추가
			
			response.sendRedirect("/main/loginRequired");	//메인의 로그인 modal로 Redirect
			log.info("Redirected to /main/loginRequired");
			
		}//if-elseIf-else
		
		return false;
		
	}//preHandle
	
}//end class