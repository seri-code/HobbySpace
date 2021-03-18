package com.comp.hobbyspace.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.comp.hobbyspace.beans.AuthBean;
import com.comp.hobbyspace.beans.ReviewBean;
import com.comp.hobbyspace.services.Authentication;
import com.comp.hobbyspace.services.Review;

@Controller
public class ExpController {

	@Autowired
	Review rv;
	@Autowired
	Authentication auth;

	ModelAndView mav = null;
	
	// 인증
	@RequestMapping(value = "/LogIn", method = RequestMethod.POST)
	public ModelAndView logIn(HttpServletRequest req, @ModelAttribute AuthBean ab) {
		return auth.entrance(req, ab);
	}
	
	@RequestMapping(value = "/LogOut", method = RequestMethod.POST)
	public ModelAndView logOut(HttpServletRequest req, @ModelAttribute AuthBean ab) {
		return auth.entrance(req, ab);
	}
	
	@RequestMapping(value = "/ToJoin", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView toJoin(HttpServletRequest req, @ModelAttribute AuthBean ab) {
		return auth.entrance(req, ab);
	}
	@RequestMapping(value = "/Join", method = RequestMethod.POST)
	public ModelAndView join(HttpServletRequest req, @ModelAttribute AuthBean ab) {
		return auth.entrance(req, ab);
	}
	
	// 리뷰
	@RequestMapping(value = "/ToResDetail", method = {RequestMethod.POST, RequestMethod.GET}) // 포스트만 되어야 하나 테스트용 GET 추가
	public ModelAndView toResDetail(HttpServletRequest req, @ModelAttribute ReviewBean rb) {
		return rv.entrance(req, rb);
	}
	@RequestMapping(value = "/ToNewReview", method = RequestMethod.POST)
	public ModelAndView toNewReview(HttpServletRequest req, @ModelAttribute ReviewBean rb) {
		return rv.entrance(req, rb);
	}
	@RequestMapping(value = "/NewReview", method = RequestMethod.POST)
	public ModelAndView newReview(HttpServletRequest req, @ModelAttribute ReviewBean rb) {
		return rv.entrance(req, rb);
	}
	@RequestMapping(value = "/ToEditReview", method = RequestMethod.POST)
	public ModelAndView toEditReview(HttpServletRequest req, @ModelAttribute ReviewBean rb) {
		return rv.entrance(req, rb);
	}
	@RequestMapping(value = "/EditReview", method = RequestMethod.POST)
	public ModelAndView editReview(HttpServletRequest req, @ModelAttribute ReviewBean rb) {
		return rv.entrance(req, rb);
	}
	@RequestMapping(value = "/DeleteReview", method = RequestMethod.POST)
	public ModelAndView deleteReview(HttpServletRequest req, @ModelAttribute ReviewBean rb) {
		return rv.entrance(req, rb);
	}
}
