package com.filmee.myapp.service;

import java.util.List;

import com.filmee.myapp.domain.FilmeeFilmsVO;
import com.filmee.myapp.domain.FilmeeReviewsVO;


public interface MainService {
	
	public abstract List<FilmeeFilmsVO> getMainFilms();
	
	public abstract List<FilmeeReviewsVO> getMainReviews();

} //end interface
