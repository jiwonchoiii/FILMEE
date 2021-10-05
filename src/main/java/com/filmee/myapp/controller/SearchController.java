package com.filmee.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.filmee.myapp.domain.CriteriaSearch;
import com.filmee.myapp.domain.SearchFilmGenreVO;
import com.filmee.myapp.domain.SearchFilmInfoVO;
import com.filmee.myapp.domain.SearchFilmVO;
import com.filmee.myapp.domain.SearchPageDTO;
import com.filmee.myapp.domain.SearchPeopleVO;
import com.filmee.myapp.domain.SearchUserVO;
import com.filmee.myapp.service.SearchService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/search/")
@Controller
public class SearchController {
	
	@Autowired
	private SearchService service;
		
	
	@PostMapping("searchFilmAutoComplete")
	@ResponseBody
	public List<SearchFilmVO> searchFilmAutoComplete(String filmTitle) {
		log.debug("searchFilmAutoComplete({}) invoked.", filmTitle);
		
		List<SearchFilmVO> listFilm = this.service.searchFilmAutoComplete(filmTitle);
		
		return listFilm;
	} //searchFilmAutoComplete
	
	@PostMapping("searchUserAutoComplete")
	@ResponseBody
	public List<SearchUserVO> searchUserAutoComplete(String nickname) {
		log.debug("searchUserAutoComplete({}) invoked.", nickname);
		
		List<SearchUserVO> listUser = this.service.searchUserAutoComplete(nickname);
		
		return listUser;
	} //searchUserAutoComplete
	
	@GetMapping("f")
	public String searchFilmPage(@ModelAttribute("cri")CriteriaSearch cri, Model model) {
		log.debug("searchFilmPage({}, {}) invoked.", cri, model);
		
		List<SearchFilmVO> filmList = this.service.getFilmListPage(cri);
		List<SearchFilmInfoVO> filmInfo = this.service.getFilmListInfo(cri);
		List<SearchFilmGenreVO> filmGenre = this.service.getFilmListGenre(cri);
		
		SearchPageDTO pageDTO = new SearchPageDTO(cri, this.service.getTotalCountFilmSearch(cri));
		
		model.addAttribute("filmList", filmList);
		model.addAttribute("filmInfo", filmInfo);
		model.addAttribute("filmGenre", filmGenre);
		model.addAttribute("pageMaker", pageDTO);
		
		return "search/searchFilmPage";		
	} //searchFilmPage
	
	@GetMapping("u")
	public String searchUserPage(@ModelAttribute("cri")CriteriaSearch cri, Model model) {
		log.debug("searchUserPage({}, {}) invoked.", cri, model);
		
		List<SearchUserVO> userList = this.service.getUserListPage(cri);
		
		SearchPageDTO pageDTO = new SearchPageDTO(cri, this.service.getTotalCountUserSearch(cri));
		
		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", pageDTO);
		
		return "search/searchUserPage";		
	} //searchUserPage

	@GetMapping("people/{peopleId}")
	public String searchPeople(@PathVariable("peopleId") String peopleId, Model model) {
		log.debug("searchPeople({}) invoked.", peopleId);
		
		List<SearchPeopleVO> films = this.service.serachFilmsByPeopleId(peopleId);
		
		films.forEach(log::info);
		
		model.addAttribute("result", films);
		
		return "search/searchPeople";
	}
	
	
} //end class