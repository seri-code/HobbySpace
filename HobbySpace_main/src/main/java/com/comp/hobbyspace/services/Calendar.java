package com.comp.hobbyspace.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.comp.hobbyspace.beans.CalendarBean;
import com.comp.hobbyspace.mapper.CalendarMapper;

@Service
public class Calendar {
	@Autowired
	private CalendarMapper mapper;

	public ModelAndView entrance(HttpServletRequest req, CalendarBean cb) {
		ModelAndView mav = null;
		switch (cb.getSCode()) {
		case "toDate":
			mav = toDateCtl(req, cb);
			break;
		case "saveD":
			mav = saveDCtl(req, cb);
			break;
		default:
			break;
		}
		return mav;
	}

	// 날짜입력페이지 이동 및 공간등록
	private ModelAndView toDateCtl(HttpServletRequest req, CalendarBean cb) {
		System.out.println("여기 온 거 맞지?");
		ModelAndView mav = new ModelAndView();
		System.out.println(cb.getSp_Code());
		System.out.println(cb.getSp_ImgName());
		System.out.println(cb.getCtCode()); // null
		System.out.println(cb.getSp_name());
		System.out.println(cb.getSp_addy1()); // 문자 깨짐 -> 인코딩 적용 -> encodingFilter
		System.out.println(cb.getSp_price());
		System.out.println(cb.getSp_intro());
		System.out.println(cb.getSp_text());
		System.out.println(cb.getSp_mobile());

		HttpSession session = req.getSession();
		cb.setUserId(session.getAttribute("accessInfo").toString());
		cb.setUserNickname(session.getAttribute("nickname").toString());
		System.out.println(cb);

		// 호스트인지 확인
		if (!this.ifHost(cb)) {
			// 호스트 테이블에 유저아이디가 없으면 호스트 신규 등록
			this.insHost(cb);
		}

		cb.setSp_addy1(cb.getSp_addy1() + " " + cb.getSp_addy2());
		insSpace(cb);// 공간등록

		for (int i = 0; i < cb.getSp_cautions().length; i++) {
			cb.setSp_caution((cb.getSp_cautions())[i]);
			insCaution(cb);// 주의사항등록
		}

		for (int i = 0; i < cb.getSp_snss().length; i++) {
			cb.setSp_sns((cb.getSp_snss())[i]);
			System.out.println(cb.getSp_Code());
			System.out.println(cb.getSp_sns());
			insSns(cb);// sns등록
		}
		System.out.println(cb.getSp_tags().length);
		for (int i = 0; i < cb.getSp_tags().length; i++) {
			cb.setSp_tag((cb.getSp_tags())[i]);
			insTag(cb);// tag등록
		}
		for(int i=0; i<cb.getSp_ImgNames().length; i++) {
			cb.setSp_ImgName2(cb.getSp_ImgNames()[i]);
			insImg(cb);
		}
		for(int i=0; i<cb.getSp_romms().length; i++) {
			cb.setSp_romm(cb.getSp_romms()[i]);
			cb.setSp_peopel(cb.getSp_peopels()[i]);
			insRoom(cb);
		}

		mav.addObject("spCode", cb.getSp_Code());
		mav.setViewName("inputDate");

		return mav;
	}

	private boolean insRoom(CalendarBean cb) {
		return convertToBoolean(mapper.insRoom(cb));	
	}
	
	private boolean insImg(CalendarBean cb) {
		return convertToBoolean(mapper.insImg(cb));	
	}
	
	private boolean ifHost(CalendarBean cb) {
		return convertToBoolean(mapper.ifHost(cb));
	}

	private void insHost(CalendarBean cb) {
		mapper.insHost(cb);
	}

	private boolean insTag(CalendarBean cb) {
		return convertToBoolean(mapper.insTag(cb));

	}

	private boolean insSns(CalendarBean cb) {
		return convertToBoolean(mapper.insSns(cb));

	}

	private boolean insCaution(CalendarBean cb) {
		return convertToBoolean(mapper.insCaution(cb));

	}

	private boolean insSpace(CalendarBean cb) {
		return convertToBoolean(mapper.insSpace(cb));

	}

	// 공간 예약 가능/불가 날짜 저장
	private ModelAndView saveDCtl(HttpServletRequest req, CalendarBean cb) {
		ModelAndView mav = new ModelAndView();
		cb.setNDates(cb.getNDate().split(","));

		if (upFinalD(cb)) {
			for (int i = 0; i < cb.getNDates().length; i++) {
				cb.setNDate(cb.getNDates()[i]);
				cb.setNDate(cb.getNDate().replace("-", ""));
				insSaveD(cb);
			}
		}

		HttpSession session = req.getSession();
		cb.setUserId(session.getAttribute("accessInfo").toString());

		mav.setViewName("redirect: /ToManageSpace?sCode=5&userId=" + cb.getUserId());
		return mav;
	}

	private boolean insSaveD(CalendarBean cb) {
		return convertToBoolean(mapper.insSaveD(cb));

	}

	private boolean convertToBoolean(int value) {
		return value > 0 ? true : false;

	}

	private boolean upFinalD(CalendarBean cb) {
		return convertToBoolean(mapper.upfinalD(cb));
	}

}
