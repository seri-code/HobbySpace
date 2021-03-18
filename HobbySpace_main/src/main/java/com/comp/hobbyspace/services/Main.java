package com.comp.hobbyspace.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;

import com.comp.hobbyspace.beans.MainBean;
import com.comp.hobbyspace.mapper.MainMapper;

@Service
public class Main {
	@Autowired
	private MainMapper maMapper;
	@Autowired
	private Gson gson;

	// 리퀘스트 매핑값(sCode에 담은 값)에 따라 백엔드 분기하는 메소드
	public ModelAndView entrance(MainBean mb) {
		ModelAndView mav = null;
		mav = mainCtl(mb);
		return mav;
	}

	// 메인 컨트롤 메소드: 찜 최다, 별점 최고, 예약 최다, 최신 리뷰 로드
	public ModelAndView mainCtl(MainBean mb) {
		ModelAndView mav = new ModelAndView();

		// 별점최다 로드
		mav.addObject("topStar", gson.toJson(this.loadStarSpace(this.getSpaceCode1(mb))));
		mav.addObject("topReserve", gson.toJson(this.loadReserveSpace(this.getSpaceCode2(mb)))); // 예약최다 로드
		mav.addObject("topZzim", gson.toJson(this.loadZzimSpace(this.getSpaceCode3(mb)))); // 찜최다 로드
		mav.addObject("review", gson.toJson(this.loadReview(mb))); // 최신리뷰 3개
		mav.setViewName("home");

		return mav;
	}

	// 최고 별점 공간코드 확인
	private MainBean getSpaceCode1(MainBean mb) {
		return maMapper.getSpaceCode1(mb);
	}

	// 최고 별점 공간 로드
	private MainBean loadStarSpace(MainBean mb) {
		return maMapper.loadStarSpace(mb);
	}

	// 최다 예약 공간코드 확인
	private MainBean getSpaceCode2(MainBean mb) {
		return maMapper.getSpaceCode2(mb);
	}

	// 최다 예약 공간 로드
	private MainBean loadReserveSpace(MainBean mb) {
		return maMapper.loadReserveSpace(mb);
	}

	// 최다 찜 공간코드 확인
	private MainBean getSpaceCode3(MainBean mb) {
		return maMapper.getSpaceCode3(mb);
	}

	// 최다 찜 공간 로드
	private MainBean loadZzimSpace(MainBean mb) {
		return maMapper.loadZzimSpace(mb);
	}

	// 최신 리뷰 로드
	public ArrayList<MainBean> loadReview(MainBean mb) {
		return maMapper.loadReview(mb);
	}

}
