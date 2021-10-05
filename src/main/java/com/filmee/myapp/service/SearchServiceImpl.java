package com.filmee.myapp.service;


import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.CriteriaSearch;
import com.filmee.myapp.domain.SearchFilmGenreVO;
import com.filmee.myapp.domain.SearchFilmInfoVO;
import com.filmee.myapp.domain.SearchFilmVO;
import com.filmee.myapp.domain.SearchPeopleVO;
import com.filmee.myapp.domain.SearchUserVO;
import com.filmee.myapp.mapper.SearchMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class SearchServiceImpl implements SearchService, InitializingBean {
	
	@Autowired
	private SearchMapper mapper;

	@Override
	public void afterPropertiesSet() throws Exception {
	
		Objects.requireNonNull(this.mapper);
		
	}//afterPropertiesSet
	
	
	@Override
	public List<SearchFilmVO> searchFilmAutoComplete(String filmTitle) {
		log.debug("searchFilmAutoComplete({}) invoked.", filmTitle);
				
		return this.mapper.getFilmList(filmTitle);
	}//searchFilmAutoComplete

	@Override
	public List<SearchPeopleVO> serachFilmsByPeopleId(String peopleId) {
		log.debug("serachFilmsByPeopleName({}) invoked.", peopleId);
		
		return this.mapper.getFilmsWithPeople(peopleId);
	}//searchFilmsByPeopleName
	
	@Override
	public List<SearchUserVO> searchUserAutoComplete(String nickname) {
		log.debug("searchUserAutoComplete({}) invoked.", nickname);
				
		return this.mapper.getUserList(nickname);
	} //searchUserAutoComplete
	
	@Override
	public List<SearchFilmVO> getFilmListPage(CriteriaSearch cri) {
		log.debug("getFilmListPage({}) invoked.", cri);
				
		return this.mapper.getFilmListPage(cri);
	} //getFilmListPage

	@Override
	public List<SearchFilmInfoVO> getFilmListInfo(CriteriaSearch cri) {
		log.debug("getFilmListInfo({}) invoked.", cri);
				
		return this.mapper.getFilmListInfo(cri);
	} //getFilmListInfo
	
	@Override
	public List<SearchFilmGenreVO> getFilmListGenre(CriteriaSearch cri) {
		log.debug("getFilmListGenre({}) invoked.", cri);
				
		return this.mapper.getFilmListGenre(cri);
	} //getFilmListGenre

	@Override
	public List<SearchUserVO> getUserListPage(CriteriaSearch cri) {
		log.debug("getUserListPage({}) invoked.", cri);
				
		return this.mapper.getUserListPage(cri);
	} //getUserListPage

	@Override
	public int getTotalCountFilmSearch(CriteriaSearch cri) {
		log.debug("getTotalCountFilmSearch({}) invoked.", cri);
				
		return this.mapper.getTotalCountFilmSearch(cri);
	} //getTotalCountFilmSearch

	@Override
	public int getTotalCountUserSearch(CriteriaSearch cri) {
		log.debug("getTotalCountUserSearch({}) invoked.", cri);
				
		return this.mapper.getTotalCountUserSearch(cri);
	} //getTotalCountUserSearch




} //end class