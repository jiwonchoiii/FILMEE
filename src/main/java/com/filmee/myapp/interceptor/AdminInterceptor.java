package com.filmee.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.filmee.myapp.controller.MainController;
import com.filmee.myapp.domain.UserVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor
public class AdminInterceptor 
	implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("preHandle(request, response, handler) invoked.");
		
		UserVO user = (UserVO)request.getSession().getAttribute(MainController.loginKey);	
		
		if(user != null && user.getIsAdmin().equals("T")) {
			return true;			
		} else {
			response.sendRedirect("/forbidden");
			return false;
		}//if-else
		
	}//preHandle

}//end class
