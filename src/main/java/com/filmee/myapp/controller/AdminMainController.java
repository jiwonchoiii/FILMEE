package com.filmee.myapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.filmee.myapp.domain.AdminVO;
import com.filmee.myapp.service.AdminService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Controller
@RequestMapping("/admin")
public class AdminMainController {
	
	@Autowired private AdminService aService;
	
	@GetMapping("/main")
	public String adminMain(Model model) {
		log.debug("adminMain() invoked.");
		
		AdminVO total = this.aService.totalCount();
		log.info(">>totalCount : "+total);
		model.addAttribute("total", total);
		
		return "admin/main";
	}//adminMain
	

}
