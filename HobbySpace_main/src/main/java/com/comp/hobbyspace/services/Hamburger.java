package com.comp.hobbyspace.services;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.comp.hobbyspace.beans.HamburgerBean;

import com.comp.hobbyspace.mapper.HamburgerMapper;
import com.comp.hobbyspace.utils.ProjectUtils;
import com.google.gson.Gson;
@Service
public class Hamburger {

	@Autowired
	private HamburgerMapper mapper;
	@Autowired
	private Gson gson;
	@Autowired
	private ProjectUtils pu;
	
	public ModelAndView entrance(HttpServletRequest req, HamburgerBean hb) {
		ModelAndView mav = null;
		switch (hb.getSCode()) {
		case "1":
			mav = logInFormCtl(hb);
			break;
		case "2":
			mav = toReserveListCtl(hb);
			break;
		case "3":
			mav = toReviewListCtl(hb);
			break;
		case "4":
			mav = toZzimListCtl(hb);
			break;
		case "5":
			mav = toManageSpaceCtl(hb);
			break;
		default:
			break;
		}
		return mav;

	}


	// 로그인폼 페이지로 이동 Ctl
	private ModelAndView logInFormCtl(HamburgerBean hb) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("logInForm");
		return mav;
	}

	// 예약 리스트 페이지로 이동 Ctl
	private ModelAndView toReserveListCtl(HamburgerBean hb) {
		ModelAndView mav = new ModelAndView();
		
		//System.out.println(session.getAttribute("accessInfo").toString());
		try {
			if(pu.getAttribute("usId") == null) {
				mav.setViewName("logInForm");
			}else {
				hb.setUserId(pu.getAttribute("usId").toString());
				System.out.println(hb.getUserId());
				ArrayList<HamburgerBean> list = this.loadGReserveList(hb);
				System.out.println(list.get(0).getRdcode());
				String jsonData1 = gson.toJson(list);
				System.out.println("햄버거 예약리스트:" + jsonData1);
				mav.addObject("loadReserve",jsonData1);
				mav.setViewName("reserveList");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mav;
		
	}

	// 게스트의 예약리스트 로드
	private ArrayList<HamburgerBean> loadGReserveList(HamburgerBean hb) {
		return mapper.loadGReserveList(hb);
	}

	// 후기관리 페이지로 이동 Ctl
	private ModelAndView toReviewListCtl(HamburgerBean hb) {
		ModelAndView mav = new ModelAndView();
		try {
			if(pu.getAttribute("usId") == null) {	
				mav.setViewName("logInForm");
			}else {
				System.out.println("후기관리 진입?");
				hb.setUserId(pu.getAttribute("usId").toString());
				ArrayList<HamburgerBean> list = this.loadGReviewList(hb);
				String jsonData1 = gson.toJson(list);
				mav.addObject("ReviewList",jsonData1);
				mav.setViewName("reviewList");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mav;
	}

	// 게스트의 후기리스트 로드
	private ArrayList<HamburgerBean> loadGReviewList(HamburgerBean hb) {
		return mapper.loadGReviewList(hb);
	}

	// 찜 리스트 페이지로 이동 Ctl
	private ModelAndView toZzimListCtl(HamburgerBean hb) {
		ModelAndView mav = new ModelAndView();
		try {
			if(pu.getAttribute("usId") == null) {
				mav.setViewName("logInForm");
			}else {
				ArrayList<HamburgerBean> list = this.loadZzimList(hb);
				String jsonData1 = gson.toJson(list);
				mav.addObject("ZzimList",jsonData1);
				mav.setViewName("zzimList");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mav;
	}

	// 찜리스트 로드
	private ArrayList<HamburgerBean> loadZzimList(HamburgerBean hb) {
		return mapper.loadZzimList(hb);
	}

	// 공간 관리 페이지로 이동 Ctl
	private ModelAndView toManageSpaceCtl(HamburgerBean hb) {
		ModelAndView mav = new ModelAndView();
		try {
			if(pu.getAttribute("usId") == null) {
				mav.setViewName("logInForm");
			}else {
				ArrayList<HamburgerBean> list = this.loadSpaceList(hb);
				String jsonData1 = gson.toJson(list);
				mav.addObject("ManageSpace",jsonData1);
				mav.setViewName("manageSpace");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mav;
	}

	// 공간리스트 로드
	private ArrayList<HamburgerBean> loadSpaceList(HamburgerBean hb) {
		return mapper.loadSpaceList(hb);
	}
}
