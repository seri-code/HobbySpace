package com.comp.hobbyspace.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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

	@RequestMapping(value = "/ToJoin", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView toJoin(HttpServletRequest req, @ModelAttribute AuthBean ab) {
		return auth.entrance(req, ab);
	}

	@RequestMapping(value = "/Join", method = RequestMethod.POST)
	public ModelAndView join(HttpServletRequest req, @ModelAttribute AuthBean ab) {
		return auth.entrance(req, ab);
	}

	// 리뷰이동 /ToResDetail
	@RequestMapping(value = "/ToNewReview", method = { RequestMethod.POST, RequestMethod.GET }) // 포스트만 되어야 하나 테스트용 get																		// GET추가
	public ModelAndView toResDetail(HttpServletRequest req, @ModelAttribute ReviewBean rb) {
		rb.setSCode("ToNewReview");
		return rv.entrance(req, rb);
	}

	// 리뷰 이미지처리
	@ResponseBody
	@RequestMapping(value = "/ReviewImg", method = RequestMethod.POST)
	public ModelAndView ReviewImg(MultipartFile[] uploadFile, @ModelAttribute ReviewBean rb) {
		rb.setSCode("ReviewImg");
		return rv.entrance(uploadFile, rb);
	}
	//리뷰작성
	@RequestMapping(value = "/NewReview", method = RequestMethod.POST)
	public ModelAndView newReview(HttpServletRequest req, @ModelAttribute ReviewBean rb) {
		rb.setSCode("NewReview");
		return rv.entrance(req, rb);
	}

	@RequestMapping(value = "/ToEditReview", method = RequestMethod.POST) //리뷰수정페이지 이동
	public ModelAndView toEditReview(HttpServletRequest req, @ModelAttribute ReviewBean rb) {
		rb.setSCode("ToEditReview");
		System.out.println("리뷰이동진입");
		return rv.entrance(req, rb);
	}

	@RequestMapping(value = "/EditReview", method = RequestMethod.POST) //리뷰 수정
	public ModelAndView editReview(HttpServletRequest req, @ModelAttribute ReviewBean rb) {
		rb.setSCode("EditReview");
		return rv.entrance(req, rb);
	}

	@RequestMapping(value = "/DeleteReview", method = RequestMethod.POST) //리뷰삭제
	public ModelAndView deleteReview(HttpServletRequest req, @ModelAttribute ReviewBean rb) {
		rb.setSCode("DeleteReview");
		return rv.entrance(req, rb);
	}
}
