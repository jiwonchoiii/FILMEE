package com.filmee.myapp.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.filmee.myapp.domain.ActivityVO;
import com.filmee.myapp.domain.CriteriaActivity;
import com.filmee.myapp.domain.CriteriaFilm;
import com.filmee.myapp.domain.CriteriaFollow;
import com.filmee.myapp.domain.CriteriaGuestbook;
import com.filmee.myapp.domain.CriteriaMain;
import com.filmee.myapp.domain.CriteriaReview;
import com.filmee.myapp.domain.FilmReactionVO;
import com.filmee.myapp.domain.FolloweeVO;
import com.filmee.myapp.domain.FollowerVO;
import com.filmee.myapp.domain.GuestbookVO;
import com.filmee.myapp.domain.LikedReviewVO;
import com.filmee.myapp.domain.MainFilmVO;
import com.filmee.myapp.domain.MainGuestbookVO;
import com.filmee.myapp.domain.MainReviewVO;
import com.filmee.myapp.domain.MainUserVO;
import com.filmee.myapp.domain.MypageReviewVO;


public interface MypageService {
	
	public abstract MainUserVO getMainUser(CriteriaMain cri);
	
	public abstract int getTotalCountMainFollowers(CriteriaMain cri);
	
	public abstract int getTotalCountMainFollowees(CriteriaMain cri);
	
	public abstract int getTotalCountMainFilms(CriteriaMain cri);
	
	public abstract int getTotalCountMainReviews(CriteriaMain cri);
	
	public abstract List<MainFilmVO> getMainFilm(CriteriaMain cri);
	
	public abstract List<MainReviewVO> getMainReview(CriteriaMain cri);
	
	public abstract List<MainGuestbookVO> getMainGuestbook(CriteriaMain cri);
	
	public abstract List<ActivityVO> getMainActivity(CriteriaMain cri);
	
	public abstract boolean deleteMainReview(Integer rno);
	
	public abstract boolean deleteMainGuestbook(Integer gno);
	
	public abstract boolean insertGuestbook(MainGuestbookVO guestbook);
	
	public abstract boolean insertFollow(Integer follower, Integer followee);
	
	public abstract boolean deleteFollow(Integer follower, Integer followee);
	
	public abstract int isFollowed(Integer follower, Integer followee);
	
	//------------------------------------------------------------------------------------//
	
	public abstract List<FilmReactionVO> getFilmReactionList(CriteriaFilm criFilm);
	
	public abstract boolean deleteFilmReaction(Integer userid, Integer filmid, Integer code);
	
	public abstract List<FollowerVO> getFollowerList(CriteriaFollow criF);
	
	public abstract boolean cancelFollower(Integer follower, Integer followee);
	
	public abstract List<FolloweeVO> getFolloweeList(CriteriaFollow criF);
	
	public abstract List<GuestbookVO> getGuestbookList(CriteriaGuestbook criG);
	
	public abstract boolean deleteGuestbook(Integer gno);
	
	public abstract List<MypageReviewVO> getMyReviewList(CriteriaReview criR);
	
	public abstract boolean deleteMyReview(Integer rno);
	
	public abstract List<LikedReviewVO> getLikedReviewList(CriteriaReview criR);
	
	public abstract boolean cancelLikedReview(Integer rno, Integer userid);
	
	public abstract List<ActivityVO> getActivityList(CriteriaActivity criA);
	
	public abstract int getTotalCountReactions(CriteriaFilm criFilm);
	
	public abstract int getTotalCountFollowers(CriteriaFollow criF);
	
	public abstract int getTotalCountFollowees(CriteriaFollow criF);
	
	public abstract int getTotalCountGuestbooks(CriteriaGuestbook criG);
	
	public abstract int getTotalCountMyReviews(CriteriaReview criR);
	
	public abstract int getTotalCountLikedReviews(CriteriaReview criR);
	
	public abstract int getTotalCountActivity(CriteriaActivity criA);
	
	//------------------------------------------------------------------------------------//
	
	public abstract boolean updateUserProfilePhoto(MultipartFile file, String profileText, String nickname, CriteriaMain cri) 
			throws IllegalStateException, IOException;
	
	public abstract boolean updateUserProfile(String profileText, String nickname, CriteriaMain cri);

} //end interface