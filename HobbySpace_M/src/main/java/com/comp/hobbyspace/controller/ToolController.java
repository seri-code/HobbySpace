package com.comp.hobbyspace.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.comp.hobbyspace.beans.CalendarBean;
import com.comp.hobbyspace.beans.ModifyBean;
import com.comp.hobbyspace.services.Calendar;
import com.comp.hobbyspace.services.Modify;

@Controller
public class ToolController {

	@Autowired
	Calendar ca;
	@Autowired
	Modify mo;

	ModelAndView mav = null;

	// 날짜선택이동 및 공간등록
	@RequestMapping(value = "/toDate", method = RequestMethod.POST)
	public ModelAndView toDate(HttpServletRequest req, @ModelAttribute CalendarBean cb) {
		cb.setSCode("toDate");
		return ca.entrance(req, cb);
	}

	// 이용가능일 달력 생성
	@RequestMapping(value = "/DateP", method = RequestMethod.POST)
	public ModelAndView DateP(HttpServletRequest req, @ModelAttribute CalendarBean cb) {
		cb.setSCode("datePick");
		return ca.entrance(req, cb);
	}

	// 공간 예약 가능/불가 날짜 저장
	@RequestMapping(value = "/SaveD", method = RequestMethod.POST)
	public ModelAndView SaveD(HttpServletRequest req, @ModelAttribute CalendarBean cb) {
		cb.setSCode("saveD");
		return ca.entrance(req, cb);
	}

	// 프로필변경페이지 이동 및 기존정보로드
	@RequestMapping(value = "/manageProfile", method = RequestMethod.POST)
	public ModelAndView manageProfile(HttpServletRequest req, @ModelAttribute ModifyBean mb) {
		return mo.entrance(req, mb);
	}

	// 닉네임 변경
	@ResponseBody
	@RequestMapping(value = "/EditNickname", method = RequestMethod.POST)
	public ModelAndView editNickname(HttpServletRequest req, @ModelAttribute ModifyBean mb) {
		mb.setSCode("editNickname");
		return mo.entrance(req, mb);
	}

	// 이메일 변경
	@ResponseBody
	@RequestMapping(value = "/EditEmail", method = RequestMethod.POST)
	public ModelAndView editEmail(HttpServletRequest req, @ModelAttribute ModifyBean mb) {
		mb.setSCode("editEmail");
		return mo.entrance(req, mb);
	}

	// 휴대폰 변경
	@ResponseBody
	@RequestMapping(value = "/EditMobile", method = RequestMethod.POST)
	public ModelAndView editMobile(HttpServletRequest req, @ModelAttribute ModifyBean mb) {
		mb.setSCode("editMobile");
		return mo.entrance(req, mb);
	}
}
