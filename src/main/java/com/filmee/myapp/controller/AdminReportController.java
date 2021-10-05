package com.filmee.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.filmee.myapp.domain.CriteriaReport;
import com.filmee.myapp.domain.PunishDTO;
import com.filmee.myapp.domain.ReportPageDTO;
import com.filmee.myapp.domain.ReportVO;
import com.filmee.myapp.service.ReportService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Controller
@RequestMapping("/admin/report")
public class AdminReportController {
	
	@Setter(onMethod_=@Autowired)
	private ReportService service;
	
	@GetMapping("/list")
	public String getList(@ModelAttribute("cri")CriteriaReport cri, Model model) {
		log.debug(">> report list () invoked.");
		
		List<ReportVO> list = this.service.getList(cri);
		ReportPageDTO page = new ReportPageDTO(cri, this.service.getTotal(cri));
		
		model.addAttribute("list",list);
		model.addAttribute("pageMaker",page);
		
		return "admin/report/list";
	}//getList

	@PostMapping("/complete")
	public String complete(PunishDTO dto) {
		log.debug("complete({}) invoked.", dto);
		
		int result = this.service.complete(dto);
		
		
		return "redirect:/admin/report/list";
		
	}//complete

}
