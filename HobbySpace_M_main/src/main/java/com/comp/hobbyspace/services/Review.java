package com.comp.hobbyspace.services;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.comp.hobbyspace.beans.ReviewBean;
import com.comp.hobbyspace.mapper.ReviewMapper;
import com.google.gson.Gson;

@Service
public class Review {
	@Autowired
	private ReviewMapper rvMapper;
	@Autowired
	private Gson gson;
	
	public ModelAndView entrance(HttpServletRequest req, ReviewBean rb) {
		System.out.println("리뷰 엔트런스 진입");
		ModelAndView mav = null;
		switch (rb.getSCode()) {
		case "ToResDetail":
			mav = this.toResDetailCtl(req, rb);
			break;
		case "ToNewReview":
			mav = this.toNewReviewCtl(req, rb);
			break;
		case "NewReview":
			mav = this.newReviewCtl(req, rb);
			break;
		case "ToEditReview":
			mav = this.toEditReviewCtl(req, rb);
			break;
		case "EditReview":
			mav = this.editReviewCtl(req, rb);
		case "DeleteReview":
			mav = this.deleteReviewCtl(req, rb);
			
		}
		return mav;
	}

	// 예약상세로 이동
	private ModelAndView toResDetailCtl(HttpServletRequest req, ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("detail", gson.toJson(this.selectResDetail(rb)));
		mav.setViewName("reserveDetail");
		return mav;
	}
	
	private ReviewBean selectResDetail(ReviewBean rb) {
		return rvMapper.selectResDetail(rb);
	}
	
	// 신규후기작성으로 이동
	private ModelAndView toNewReviewCtl(HttpServletRequest req, ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("reserve", this.selectResDetCode(rb));
		mav.setViewName("reviewEditor");
		return mav;
	}
	
	private ReviewBean selectResDetCode(ReviewBean rb) {
		return rvMapper.selectResDetCode(rb);
	}
	
	// 신규후기 작성
	private ModelAndView newReviewCtl(HttpServletRequest req, ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		this.insReview(rb);
		mav.setViewName("reviewList");
		return mav;
	}
	
	private void insReview(ReviewBean rb) {
		rvMapper.insReview(rb);
	}
	
	// 후기 수정으로 이동
	private ModelAndView toEditReviewCtl(HttpServletRequest req, ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("review", this.selectReview(rb));
		mav.setViewName("reviewEditor");
		return mav;
	}
	
	private ReviewBean selectReview(ReviewBean rb) {
		return rvMapper.selectReview(rb);
	}
	
	// 후기 수정
	private ModelAndView editReviewCtl(HttpServletRequest req, ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		this.editReview(rb);
		mav.setViewName("reviewList");
		return mav;
	}
	
	private void editReview(ReviewBean rb) {
		rvMapper.editReview(rb);
	}

	// 후기 삭제
	private ModelAndView deleteReviewCtl(HttpServletRequest req, ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		this.deleteReview(rb);
		return mav;
	}

	private void deleteReview(ReviewBean rb) {
		rvMapper.deleteReview(rb);
	}

}
