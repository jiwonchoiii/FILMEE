package com.filmee.myapp.controller;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.filmee.myapp.domain.AdminUserPageDTO;
import com.filmee.myapp.domain.Criteria;
import com.filmee.myapp.domain.UserCountsVO;
import com.filmee.myapp.domain.UserVO;
import com.filmee.myapp.service.AdminUserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/admin/user")
@Controller
public class AdminUserController implements InitializingBean {
	
	@Setter(onMethod_=@Autowired)
	private AdminUserService service;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		log.debug("afterPropertiesSet() invoked.");
		
		Objects.requireNonNull(this.service);
	}//afterPropertiesSet

	
	@GetMapping("")
	public String list(@ModelAttribute("cri") Criteria cri, Model model) {
		log.debug("list({}, model) invoked.", cri);
		
		List<UserVO> users = this.service.getList(cri);
		
		Objects.requireNonNull(users);
		
		AdminUserPageDTO pageDTO = new AdminUserPageDTO(cri,this.service.getTotal(cri));
		
		UserCountsVO vo = this.service.getUsersStatus();
		
		String pagingUri = cri.getPagingUri();
		log.info("pagingUri : {}", pagingUri);
		
		model.addAttribute("pagingUri", pagingUri);
		model.addAttribute("list", users);
		model.addAttribute("pageMaker", pageDTO);
		model.addAttribute("count", vo);
		
		return "/admin/user/list";
	}//list
	
	@PostMapping("/changeIsAdmin")
	public String changeIsAdmin(Criteria cri, Integer userId) {
		log.debug("changeIsAdmin({}, {}, {}) invoked.", cri, userId);
		
		this.service.changeUserAdmin(userId);
		
		String pagingUri = cri.getPagingUri();
		log.info("pagingUri : {}", pagingUri);
		
		return "redirect:/admin/user"+pagingUri;
	
	
	}
}//end class
