package com.filmee.myapp.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;



import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
import com.filmee.myapp.domain.MyPageDTO;
import com.filmee.myapp.domain.MypageReviewVO;


import com.filmee.myapp.domain.UserDTO;
import com.filmee.myapp.domain.UserVO;
import com.filmee.myapp.service.LoginService;

import com.filmee.myapp.service.MypageService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/mypage/")
@Controller
public class MypageController {
	
	@Autowired
	MypageService service;
	


	@Autowired
	LoginService loginService;
	

	@GetMapping("main")
	public String myPageMain(@ModelAttribute("cri")CriteriaMain cri, Model model, HttpServletRequest req) {
		log.debug("myPageMain({}, {}) invoked", cri, model);
		
		HttpSession session = req.getSession();
		
		UserVO user = (UserVO) session.getAttribute("__LOGIN__");
		
		if(user == null) {
			
			model.addAttribute("isFollowed", 2);
			
		} else {
			int follower = cri.getUserid();
			int followee = user.getUserId();
			
			int isFollowed = this.service.isFollowed(follower, followee);
			
			model.addAttribute("isFollowed", isFollowed);
			
		} //if-else
		
				
		MainUserVO userVO = this.service.getMainUser(cri);
		int followers = this.service.getTotalCountMainFollowers(cri);
		int followees = this.service.getTotalCountMainFollowees(cri);
		int films = this.service.getTotalCountMainFilms(cri);
		int reviews = this.service.getTotalCountMainReviews(cri);
		List<MainFilmVO> filmVO = this.service.getMainFilm(cri);
		List<MainReviewVO> reviewVO = this.service.getMainReview(cri);
		List<MainGuestbookVO> guestbookVO = this.service.getMainGuestbook(cri);
		List<ActivityVO> activityVO = this.service.getMainActivity(cri);	
		
		model.addAttribute("userVO", userVO);
		model.addAttribute("followers", followers);
		model.addAttribute("followees", followees);
		model.addAttribute("films", films);
		model.addAttribute("reviews", reviews);
		model.addAttribute("filmVO", filmVO);
		model.addAttribute("reviewVO", reviewVO);
		model.addAttribute("guestbookVO", guestbookVO);
		model.addAttribute("activityVO", activityVO);
		
		
		return "mypage/myPageMain";
	} //myPageMain
	
	@GetMapping("films")
	public String getFilmReactionList(@ModelAttribute("cri")CriteriaFilm criFilm, Model model) {
		log.debug("getFilmReactionList({}, {}) invoked", criFilm, model);
				
		List<FilmReactionVO> reactions = this.service.getFilmReactionList(criFilm);
		
		MyPageDTO pageDTO = new MyPageDTO(criFilm, this.service.getTotalCountReactions(criFilm));
		
		model.addAttribute("films", reactions);
		model.addAttribute("pageMaker", pageDTO);
		
		return "mypage/myPageFilms";
	} //getFilmReactionList
	
	@GetMapping("follower")
	public String getFollowerList(@ModelAttribute("criF")CriteriaFollow criF, Model model) {
		log.debug("getFollowerList({}, {}) invoked", criF, model);
		
		List<FollowerVO> followers = this.service.getFollowerList(criF);
		
		MyPageDTO pageDTO = new MyPageDTO(criF, this.service.getTotalCountFollowers(criF));
		
		model.addAttribute("followers", followers);
		model.addAttribute("pageMaker", pageDTO);
		
		return "mypage/myPageFollower";
	} //getFollowerList
	
	@GetMapping("followee")
	public String getFolloweeList(@ModelAttribute("criF")CriteriaFollow criF, Model model) {
		log.debug("getFolloweeList({}, {}) invoked", criF, model);
		
		List<FolloweeVO> followees = this.service.getFolloweeList(criF);
		
		MyPageDTO pageDTO = new MyPageDTO(criF, this.service.getTotalCountFollowees(criF));
		
		model.addAttribute("followees", followees);
		model.addAttribute("pageMaker", pageDTO);
		
		return "mypage/myPageFollowee";
	} //getFolloweeList
	
	@GetMapping("myreviews")
	public String getMyReviewList(@ModelAttribute("criR")CriteriaReview criR, Model model) {
		log.debug("getMyReviewList({}, {}) invoked", criR, model);
		
		List<MypageReviewVO> myReviews = this.service.getMyReviewList(criR);
		
		MyPageDTO pageDTO = new MyPageDTO(criR, this.service.getTotalCountMyReviews(criR));
		
		model.addAttribute("myReviews", myReviews);
		model.addAttribute("pageMaker", pageDTO);
		
		return "mypage/myPageMyReviews";
	} //getMyReviewList
	
	@GetMapping("likedreviews")
	public String getLikedReviewList(@ModelAttribute("criR")CriteriaReview criR, Model model) {
		log.debug("getLikedReviewList({}, {}) invoked", criR, model);
		
		List<LikedReviewVO> likedReviews = this.service.getLikedReviewList(criR);
		
		MyPageDTO pageDTO = new MyPageDTO(criR, this.service.getTotalCountLikedReviews(criR));
		
		model.addAttribute("likedReviews", likedReviews);
		model.addAttribute("pageMaker", pageDTO);
		
		return "mypage/myPageLikedReviews";
	} //getLikedReviewList
	
	@GetMapping("activity")
	public String getActivityList(@ModelAttribute("criA")CriteriaActivity criA, Model model) {
		log.debug("getActivityList({}, {}) invoked", criA, model);
		
		List<ActivityVO> activity = this.service.getActivityList(criA);
		
		MyPageDTO pageDTO = new MyPageDTO(criA, this.service.getTotalCountActivity(criA));
		
		model.addAttribute("activity", activity);
		model.addAttribute("pageMaker", pageDTO);
		
		return "mypage/myPageActivity";
	} //getActivityList
	
	@GetMapping("guestbook")
	public String getGuestBookList(@ModelAttribute("criG")CriteriaGuestbook criG, Model model) {
		log.debug("getGuestBookList({}, {}) invoked", criG, model);
		
		List<GuestbookVO> guestbook = this.service.getGuestbookList(criG);
		
		MyPageDTO pageDTO = new MyPageDTO(criG, this.service.getTotalCountGuestbooks(criG));
		
		model.addAttribute("guestbook", guestbook);
		model.addAttribute("pageMaker", pageDTO);
		
		return "mypage/myPageGuestBook";
	} //getGuestBookList
	
	@PostMapping("deleteMainReview")
	public String deleteMainReview(@ModelAttribute("cri")CriteriaMain cri, @RequestParam("rno") Integer rno, RedirectAttributes rttrs) {
		log.debug("deleteMainReview({}, {}) invoked.", rno, rttrs);
		
		boolean isRemoved = this.service.deleteMainReview(rno);
		
		if(isRemoved) {
			rttrs.addFlashAttribute("result", "success");
		} //if
		
		rttrs.addAttribute("userid", cri.getUserid());
		
		return "redirect:/mypage/main";
	} //deleteMainReview
	
	@PostMapping("deleteMainGuestbook")
	public String deleteMainGuestbook(@ModelAttribute("cri")CriteriaMain cri, @RequestParam("gno") Integer gno, RedirectAttributes rttrs) {
		log.debug("deleteMainGuestbook({}, {}) invoked.", gno, rttrs);
		
		boolean isRemoved = this.service.deleteMainGuestbook(gno);
		
		if(isRemoved) {
			rttrs.addFlashAttribute("result", "success");
		} //if
		
		rttrs.addAttribute("userid", cri.getUserid());
		
		return "redirect:/mypage/main";
	} //deleteMainGuestbook
	
	@PostMapping("insertGuestbook")
	public String insertGuestbook(@ModelAttribute("cri")CriteriaMain cri, MainGuestbookVO guestbook, RedirectAttributes rttrs) {
		log.debug("deleteMainGuestbook({}, {}) invoked.", guestbook, rttrs);
		
		boolean isInserted = this.service.insertGuestbook(guestbook);
		
		if(isInserted) {
			rttrs.addFlashAttribute("result", "success");
		} //if
		
		rttrs.addAttribute("userid", cri.getUserid());
		
		return "redirect:/mypage/main";
	} //insertGuestbook
	
	@PostMapping("insertFollow")
	public String insertFollow(@ModelAttribute("cri")CriteriaMain cri, @RequestParam("userid") Integer follower, @RequestParam("sessionUserid") Integer followee , RedirectAttributes rttrs) {
		log.debug("insertFollow({}, {}, {}) invoked.", follower, followee, rttrs);
		
		boolean isInserted = this.service.insertFollow(follower, followee);
		
		if(isInserted) {
			rttrs.addFlashAttribute("result", "success");
		} //if
		
		rttrs.addAttribute("userid", cri.getUserid());
		
		return "redirect:/mypage/main";
	} //insertFollow
	
	@PostMapping("deleteFollow")
	public String deleteFollow(@ModelAttribute("cri")CriteriaMain cri, @RequestParam("userid") Integer follower, @RequestParam("sessionUserid") Integer followee , RedirectAttributes rttrs) {
		log.debug("deleteFollow({}, {}, {}) invoked.", follower, followee, rttrs);
		
		boolean isRemoved = this.service.deleteFollow(follower, followee);
		
		if(isRemoved) {
			rttrs.addFlashAttribute("result", "success");
		} //if
		
		rttrs.addAttribute("userid", cri.getUserid());
		
		return "redirect:/mypage/main";
	} //deleteFollow
	
	@PostMapping("deleteFilmReaction")
	public String deleteFilmReaction(@ModelAttribute("criFilm")CriteriaFilm criFilm, 
			@RequestParam("userid") Integer userid, @RequestParam("filmid") Integer filmid, @RequestParam("code") Integer code, RedirectAttributes rttrs) {
		log.debug("deleteFilmReaction({}, {}, {}, {}) invoked.", userid, filmid, code, rttrs);
		
		boolean isRemoved = this.service.deleteFilmReaction(userid, filmid, code);
		
		if(isRemoved) {
			rttrs.addFlashAttribute("result", "success");
		} //if
		
		rttrs.addAttribute("userid", criFilm.getUserid());
		rttrs.addAttribute("code", criFilm.getCode());
		rttrs.addAttribute("currPage", criFilm.getCurrPage());
		rttrs.addAttribute("amount", criFilm.getAmount());
		rttrs.addAttribute("pagesPerPage", criFilm.getPagesPerPage());
		
		return "redirect:/mypage/films";
	} //deleteFilmReaction
	
	@PostMapping("cancelFollower")
	public String cancelFollower(@ModelAttribute("criF")CriteriaFollow criF, 
			@RequestParam("follower") Integer follower, @RequestParam("followee") Integer followee, RedirectAttributes rttrs) {
		log.debug("cancelFollower({}, {}, {}) invoked.", follower, followee, rttrs);
		
		boolean isRemoved = this.service.cancelFollower(follower, followee);
		
		if(isRemoved) {
			rttrs.addFlashAttribute("result", "success");
		} //if
		
		rttrs.addAttribute("userid", criF.getUserid());		
		rttrs.addAttribute("currPage", criF.getCurrPage());
		rttrs.addAttribute("amount", criF.getAmount());
		rttrs.addAttribute("pagesPerPage", criF.getPagesPerPage());
		
		return "redirect:/mypage/follower";
	} //cancelFollower
	
	@PostMapping("deleteGuestbook")
	public String deleteGuestbook(@ModelAttribute("cri")CriteriaGuestbook criG, @RequestParam("gno") Integer gno, RedirectAttributes rttrs) {
		log.debug("deleteGuestbook({}, {}) invoked.", gno, rttrs);
		
		boolean isRemoved = this.service.deleteGuestbook(gno);
		
		if(isRemoved) {
			rttrs.addFlashAttribute("result", "success");
		} //if
		
		rttrs.addAttribute("userid", criG.getUserid());		
		rttrs.addAttribute("currPage", criG.getCurrPage());
		rttrs.addAttribute("amount", criG.getAmount());
		rttrs.addAttribute("pagesPerPage", criG.getPagesPerPage());
		
		return "redirect:/mypage/guestbook";
	} //deleteGuestbook
	
	@PostMapping("deleteMyReview")
	public String deleteMyReview(@ModelAttribute("criR")CriteriaReview criR, @RequestParam("rno") Integer rno, RedirectAttributes rttrs) {
		log.debug("deleteMyReview({}, {}) invoked.", rno, rttrs);
		
		boolean isRemoved = this.service.deleteMyReview(rno);
		
		if(isRemoved) {
			rttrs.addFlashAttribute("result", "success");
		} //if
		
		rttrs.addAttribute("userid", criR.getUserid());		
		rttrs.addAttribute("currPage", criR.getCurrPage());
		rttrs.addAttribute("amount", criR.getAmount());
		rttrs.addAttribute("pagesPerPage", criR.getPagesPerPage());
		
		return "redirect:/mypage/myreviews";
	} //deleteMyReview
	
	@PostMapping("cancelLikedReview")
	public String cancelLikedReview(@ModelAttribute("criR")CriteriaReview criR, @RequestParam("rno") Integer rno, @RequestParam("userid") Integer userid, RedirectAttributes rttrs) {
		log.debug("deleteMyReview({}, {}, {}) invoked.", rno, userid, rttrs);
		
		boolean isRemoved = this.service.cancelLikedReview(rno, userid);
		
		if(isRemoved) {
			rttrs.addFlashAttribute("result", "success");
		} //if
		
		rttrs.addAttribute("userid", criR.getUserid());		
		rttrs.addAttribute("currPage", criR.getCurrPage());
		rttrs.addAttribute("amount", criR.getAmount());
		rttrs.addAttribute("pagesPerPage", criR.getPagesPerPage());
		
		return "redirect:/mypage/likedreviews";
	} //deleteMyReview


	
	
	@PostMapping(path = "registerUserProfile", consumes = {"multipart/form-data"})
	public String registerUserProfile(@ModelAttribute("cri")CriteriaMain cri, @RequestParam("userid") Integer userid, @RequestParam("profileText") String profileText, @RequestPart MultipartFile file, @RequestParam("nickname") String nickname, RedirectAttributes rttrs)
			throws IllegalStateException, IOException {
		log.debug("registerUserProfile({}, {}, {}, {}, {}) invoked.", file, userid, profileText, nickname, rttrs);
		
		if(file.getSize() != 0) {
			boolean isUpdated = this.service.updateUserProfilePhoto(file, profileText, nickname, cri);
			
			if(isUpdated) {
				rttrs.addFlashAttribute("result", "success");
			} //if			
		} else {
			
			boolean isUpdated = this.service.updateUserProfile(profileText, nickname, cri);
			
			if(isUpdated) {
				rttrs.addFlashAttribute("result", "success");
			} //if
		} //if-else
		
		
		rttrs.addAttribute("userid", cri.getUserid());
		
		return "redirect:/mypage/main";
	} //registerUserProfile
	
	
	//forgotPw.jsp 혹은 xxxx.jsp(마이페이지)에 심어놓은 new-pw modal에서 submit 시
	@PostMapping("newPassword")
	public String newPassword(UserDTO dto, RedirectAttributes rttrs) throws Exception {
		log.debug("newPassword({}) invoked.", dto);
			
		int result = this.loginService.changePassword(dto);
		log.info("result : {}", result);
		
		switch(result) {
			case 1: 
				log.info(">>>>> result : 1 >>>>>>");				
				rttrs.addFlashAttribute("message", "temp_pw_sent");
				return "redirect:/main";	//비밀번호 찾기로 Redirect 후 메세지 띄움

			case 2:
				log.info(">>>>> result : 2 >>>>>>");
				rttrs.addFlashAttribute("message", "pw_changed");
				return "redirect:/mypage/main";	//마이페이지로 Redirect 후 메세지 띄움
				
			default:
				log.info(">>>>> result : 3 >>>>>>");
				return "redirect:/main/exception";	//다 안되면 Exception 페이지로 이동
		}//switch-case
	
	}//newPassword
	
	//xxxx.jsp의 new_pw modal에서 현재 비밀번호 검증시 
	@ResponseBody
	@PostMapping("checkCurrentPw")
	public Integer checkCurrentPw(UserDTO dto) throws Exception {
		log.debug("newPassword({}) invoked.", dto);
		
		UserVO user = this.loginService.login(dto);		//이메일과 비밀번호로 로그인 여부 확인
		if(user == null) {	//로그인에 실패한다면
			return 0;
		}else {				//로그인에 성공한다면
			return 1;
		}//if-else

	}//checkCurrentPw


} //end class