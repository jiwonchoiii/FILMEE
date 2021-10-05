package com.filmee.myapp.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.filmee.myapp.controller.MainController;
import com.filmee.myapp.domain.UserVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor
public class LogInOutInterceptor
	implements HandlerInterceptor{
		
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("preHandle(request, response, handler) invoked.");
		
		// RememberMe 쿠키 삭제
		Cookie rememberMeCookie = 
				WebUtils.getCookie(request, MainController.rememberMeKey);
		
		if(rememberMeCookie != null) {
			rememberMeCookie.setMaxAge(0);	
			rememberMeCookie.setPath("/");
			response.addCookie(rememberMeCookie);
			log.info(">>>>> RememberMeCookie removed. >>>>>");
		}//if
		
		//Session Scope에서 기존 로그인 정보 획득
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute(MainController.loginKey);	
		
		//기존 로그인 정보가 있다면 삭제
		if(user != null) {			
			session.invalidate();
			log.info(">>>>> Session invalidated. >>>>>");
			log.info(">>>>> LoginKey removed. >>>>>");
		}//if
	
		return true;
	}//preHandle
	
}//end class