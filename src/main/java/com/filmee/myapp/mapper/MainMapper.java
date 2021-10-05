package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.FilmeeFilmsVO;
import com.filmee.myapp.domain.FilmeeReviewsVO;


public interface MainMapper {
	
	public abstract List<FilmeeFilmsVO> getMainFilms();
	
	public abstract List<FilmeeReviewsVO> getMainReviews();

} //end class
