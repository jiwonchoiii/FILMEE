package com.filmee.myapp.controller;

import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.filmee.myapp.domain.CriteriaFilmReview;
import com.filmee.myapp.domain.CriteriaReview;
import com.filmee.myapp.domain.FilmGenreVO;
import com.filmee.myapp.domain.FilmPeopleVO;
import com.filmee.myapp.domain.FilmVO;
import com.filmee.myapp.domain.ReviewCommentUserVO;
import com.filmee.myapp.domain.ReviewDTO;
import com.filmee.myapp.domain.ReviewFilmUserVO;
import com.filmee.myapp.domain.ReviewHeartVO;
import com.filmee.myapp.domain.ReviewPageDTO;
import com.filmee.myapp.domain.ReviewVO;
import com.filmee.myapp.domain.UserVO;
import com.filmee.myapp.service.FilmService;
import com.filmee.myapp.service.ReviewCommentService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/film/")
@Controller
public class FilmController {

	@Autowired
	private FilmService service;
	@Autowired
	private ReviewCommentService rcService;

	@GetMapping("/{filmid}")
	public String getFilmInfo(@PathVariable("filmid") Integer film_id, Integer rno, Model model) {
		log.debug("getFilmInfo({}, {}, {}) invoked.", film_id, rno, model);

		FilmVO filmVO = this.service.getFilmInfo(film_id);
		List<FilmPeopleVO> filmPeopleVOList = this.service.getFilmPeople(film_id);
		List<FilmGenreVO> filmGenreVOList = this.service.getGenre(film_id);
		List<ReviewFilmUserVO> reviewFilmUserVOList = this.service.getList(film_id);

		assert filmVO != null;
		assert filmPeopleVOList != null;
		assert filmGenreVOList != null;
		assert reviewFilmUserVOList != null;

		log.info("\t+ filmVO: {}", filmVO);
		filmPeopleVOList.forEach(log::info);
		filmGenreVOList.forEach(log::info);
		reviewFilmUserVOList.forEach(log::info);

		model.addAttribute("filmVO", filmVO);
		model.addAttribute("filmPeopleVOList", filmPeopleVOList);
		model.addAttribute("filmGenreVOList", filmGenreVOList);
		model.addAttribute("reviewFilmUserVOList", reviewFilmUserVOList);

		return "film";
	} // getFilmInfo

	// ----------------------------------------------------//

	@GetMapping({ "/{filmid}/review/{rno}" })
	public String getReview(@PathVariable("filmid") Integer film_id, @PathVariable("rno") Integer rno,
			ReviewHeartVO heart, @SessionAttribute(value = "__LOGIN__", required = false) UserVO user,
			@ModelAttribute("cri") CriteriaFilmReview cri, Model model) {
		log.debug("getReview({}, {}, {}, {}) invoked.", film_id, rno, heart, user);

		ReviewFilmUserVO reviewFilmUserVO = this.service.get(rno);
		List<ReviewCommentUserVO> reviewCommentList = this.rcService.getList(rno);

		assert reviewFilmUserVO != null;
		log.info("\t+ reviewFilmUserVO: {}", reviewFilmUserVO);

		int heartCnt = this.service.heartCnt(rno);

		if (user != null) {
			heart.setRno(rno);
			heart.setUserId(user.getUserId());
			if (this.service.check(rno, user.getUserId()) == null) {
				int aLine = this.service.heartInsert(heart);
				log.info(">>>>>>> heartInsert : " + heart);
				log.info(">>>>>>> Result : " + aLine);
				heart = this.service.check(rno, user.getUserId());
				model.addAttribute("heart", heart);
			} else {
				heart = this.service.check(rno, user.getUserId());
				model.addAttribute("heart", heart);
			}

		}

		model.addAttribute("reviewFilmUserVO", reviewFilmUserVO);
		model.addAttribute("reviewCommentList", reviewCommentList);
		model.addAttribute("heartCnt", heartCnt);

		return "review/get";
	} // getReview

	@GetMapping({ "/{filmid}/review/m/{rno}/" })
	public String modifyReview(@PathVariable("filmid") Integer film_id, @PathVariable("rno") Integer rno,
//			@SessionAttribute(value="__LOGIN__", required=false) UserVO user,
			@ModelAttribute("cri") CriteriaFilmReview cri, Model model) {
		log.debug("readReview({}, {}) invoked.", rno, model);

		ReviewFilmUserVO reviewFilmUserVO = this.service.get(rno);

		assert reviewFilmUserVO != null;
		log.info("\t+ reviewFilmUserVO: {}", reviewFilmUserVO);

		model.addAttribute("reviewFilmUserVO", reviewFilmUserVO);

		return "review/modify";
	} // getReview

	@PostMapping("/{filmid}/review/m/{rno}/")
	public String modify(@ModelAttribute("cri") CriteriaFilmReview criFR, ReviewVO review, RedirectAttributes rttrs) {
		log.debug("modifyReview({}, {}) invoked.", review, rttrs);

		int modifiedReview = this.service.modify(review);

		if (modifiedReview == 1) {
			rttrs.addFlashAttribute("result", "success");
		} // if

		return "redirect:/film/{filmid}/review/{rno}";
	} // modify

	@PostMapping("/{filmid}/review/register")
	public String register(@PathVariable("filmid") Integer film_id, @ModelAttribute("reviewCri") CriteriaFilmReview cri,
			ReviewDTO review, HttpSession session, UserVO user, RedirectAttributes rttrs) {
		log.debug("register({}, {}, {}, {}) invoked.", film_id, cri, review, rttrs);

		this.service.register(review);

		rttrs.addFlashAttribute("result", review.getRno());

		return "redirect:/film/{filmid}";
	} // registerReview

	@GetMapping("/{filmid}/review/register")
	public String register(@PathVariable("filmid") Integer film_id, @ModelAttribute("reviewCri") CriteriaFilmReview cri,
			Model model) {
		log.debug("register({}, {}) invoked.", film_id, cri);

		FilmVO filmVO = this.service.getFilmInfo(film_id);

		model.addAttribute("filmVO", filmVO);

		return "review/register";
	} // register

	@PostMapping("review/remove")
	public String remove(@ModelAttribute("criR") CriteriaReview criR, UserVO user, Integer rno,
			RedirectAttributes rttrs) {
		log.debug("remove({}, {}, {}, {}) invoked.", criR, user, rno, rttrs);

		int removed = this.service.remove(rno);

		rttrs.addAttribute("userid", criR.getUserid());
		rttrs.addAttribute("currPage", criR.getCurrPage());
		rttrs.addAttribute("amount", criR.getAmount());
		rttrs.addAttribute("pagesPerPage", criR.getPagesPerPage());

		return "redirect:/mypage/myreviews?userid=" + user.getUserId() + "&currPage=" + criR.getCurrPage() + "&amount="
				+ criR.getAmount() + "&pagesPerPage=" + criR.getPagesPerPage();

	} // deleteMyReview

	@GetMapping("/{filmid}/reviews")
	public String listPerPage(@PathVariable("filmid") Integer film_id,
			@ModelAttribute("criFR") CriteriaFilmReview criFR, RedirectAttributes rttrs, Model model) {
		log.debug("listPerPage({}) invoked.", model);

		List<ReviewFilmUserVO> reviewFilmUserVOList = this.service.getListWithPaging(new CriteriaFilmReview(film_id));

		FilmVO filmVO = this.service.getFilmInfo(film_id);
		int totalCount = this.service.getTotalCount(film_id);

		Objects.requireNonNull(reviewFilmUserVOList);
		reviewFilmUserVOList.forEach(log::info);
		log.info(filmVO);

		ReviewPageDTO pageDTO = new ReviewPageDTO(film_id, criFR, this.service.getTotalCount(film_id));
		rttrs.addAttribute("film_id", film_id);
		rttrs.addAttribute("currPage", criFR.getCurrPage());
		rttrs.addAttribute("amount", criFR.getAmount());
		rttrs.addAttribute("pagesPerPage", criFR.getPagesPerPage());

		model.addAttribute("reviewFilmUserVOList", reviewFilmUserVOList);
		model.addAttribute("ReviewPageDTO", pageDTO);
		model.addAttribute("filmVO", filmVO);
		model.addAttribute("totalCount", totalCount);

		return "review/list";
	} // listPerPage

	// 좋아요
	@PostMapping("review/like/{rno}/{userid}")
	public ResponseEntity<String> likeIt(@PathVariable("rno") int rno, @PathVariable("userid") int userid) {
		log.debug("likeIt({},{}) invoked.", rno, userid);

		int aLine = this.service.heartCheck(rno, userid);
		this.service.heartCnt(rno);

		return aLine == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}// likeIt

	// 좋아요 취소
	@PostMapping("review/unlike/{rno}/{userid}")

	public ResponseEntity<String> unLike(@PathVariable("rno") int rno, @PathVariable("userid") int userid) {
		log.debug("unLike({},{}) invoked.", rno, userid);

		int aLine = this.service.heartUncheck(rno, userid);
		this.service.heartCnt(rno);
		return aLine == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}// unLike

} // end class
