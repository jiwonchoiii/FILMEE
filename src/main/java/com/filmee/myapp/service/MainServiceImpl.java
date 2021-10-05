package com.filmee.myapp.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.FilmeeFilmsVO;
import com.filmee.myapp.domain.FilmeeReviewsVO;
import com.filmee.myapp.mapper.MainMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class MainServiceImpl implements MainService, InitializingBean {
	
	@Autowired
	private MainMapper mapper;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		log.debug("afterPropertiesSet() invoked.");
		
		Objects.requireNonNull(this.mapper);
	}//afterPropertiesSet
	
	
	@Override	
	public List<FilmeeFilmsVO> getMainFilms() {
		log.debug("getMainFilms() invoked.");
				
		return this.mapper.getMainFilms();
	} //getMainFilms

	@Override
	public List<FilmeeReviewsVO> getMainReviews() {
		log.debug("getMainReviews() invoked.");
		
		return this.mapper.getMainReviews();
	} //getMainReviews

} //end class
