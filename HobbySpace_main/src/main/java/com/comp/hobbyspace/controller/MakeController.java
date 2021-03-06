package com.comp.hobbyspace.controller;

import com.comp.hobbyspace.services.Reserve;
import com.comp.hobbyspace.utils.ProjectUtils;
import com.comp.hobbyspace.services.Hamburger;
import com.comp.hobbyspace.beans.HamburgerBean;
import com.comp.hobbyspace.beans.ReserveBean;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MakeController {

	@Autowired
	Reserve res;
	@Autowired
	Hamburger ham;
	@Autowired
	private ProjectUtils pu;
	
	ModelAndView mav = null; 

	// 햄버거
	@RequestMapping(value = "/LogInForm", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView LoginForm(HttpServletRequest req, @ModelAttribute HamburgerBean hb) {
		return ham.entrance(req, hb);
	}
	//예약리스트
	@RequestMapping(value = "/ToReserveList", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView ToReserveList(HttpServletRequest req, @ModelAttribute HamburgerBean hb) {
		return ham.entrance(req, hb);
	}
	//리뷰리스트
	@RequestMapping(value = "/ToReviewList", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView ToReviewList(HttpServletRequest req, @ModelAttribute HamburgerBean hb) {
		return ham.entrance(req, hb);
	}
	//찜리스트
	@RequestMapping(value = "/ToZzimList", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView toZzimList(HttpServletRequest req, @ModelAttribute HamburgerBean hb) {
		return ham.entrance(req, hb);
	}
	//공간관리
	@RequestMapping(value = "/ToManageSpace", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView toManageSpace(HttpServletRequest req, @ModelAttribute HamburgerBean hb) {
		return ham.entrance(req, hb);
	}

	// 예약
	@RequestMapping(value = "/Room", method = RequestMethod.POST)
	@ResponseBody
	public String Room(HttpServletRequest req, @ModelAttribute ReserveBean rb) throws UnsupportedEncodingException {
		ModelAndView mav = res.entrance(req, rb);
		return URLEncoder.encode(mav.getModel().get("roomList").toString(), "UTF-8");
	}

	@RequestMapping(value = "/finald", method = RequestMethod.POST)
	@ResponseBody
	public String people(HttpServletRequest req, @ModelAttribute ReserveBean rb) throws UnsupportedEncodingException {
		ModelAndView mav = res.entrance(req, rb);
		return URLEncoder.encode(mav.getModel().get("finald").toString(), "UTF-8");
	}

	@RequestMapping(value = "/falsed", method = RequestMethod.POST)
	@ResponseBody
	public String falsed(HttpServletRequest req, @ModelAttribute ReserveBean rb) throws UnsupportedEncodingException {
		ModelAndView mav = res.entrance(req, rb);
		return URLEncoder.encode(mav.getModel().get("falsed").toString(), "UTF-8");
	}

	@RequestMapping(value = "/Temp", method = RequestMethod.POST)
	public ModelAndView Temp(HttpServletRequest req, @ModelAttribute ReserveBean rb) {

		return res.entrance(req, rb);
	}
	@RequestMapping(value = "/reservTempTest", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView TempTest(HttpServletRequest req, @ModelAttribute ReserveBean rb) {

		return res.entrance(req, rb);
	}

	@RequestMapping(value = "/Reserve", method = RequestMethod.POST)
	public ModelAndView Reserve(HttpServletRequest req, @ModelAttribute ReserveBean rb) {
		System.out.println("진입--------------------");
		System.out.println(rb.getRsphones());
		System.out.println(rb.getRsemails());
		System.out.println(rb.getRsterospCodes()); 
		System.out.println(rb.getRsteronums());
		System.out.println(rb.getRsusedates());
		System.out.println(rb.getRstepeoples());
		rb.setSCode("5");
		return res.entrance(req, rb);
	}
	
	@RequestMapping(value = "/reservDetail", method = RequestMethod.POST)
	public ModelAndView reservDetail(HttpServletRequest req, @ModelAttribute ReserveBean rb) {	
		return  res.entrance(req, rb);
	}
	
	@RequestMapping(value = "/ToHostReserveList", method = RequestMethod.POST)
	@ResponseBody
	public String ToHostReserveList(HttpServletRequest req, @ModelAttribute ReserveBean rb)throws UnsupportedEncodingException {
		ModelAndView mav = res.entrance(req, rb);
		return URLEncoder.encode(mav.getModel().get("ToHostReserveList").toString(),"UTF-8");
	}
	
	@RequestMapping(value = "/NOStatus", method = RequestMethod.POST)
	@ResponseBody
	public String NOStatus(HttpServletRequest req, @ModelAttribute ReserveBean rb)throws UnsupportedEncodingException {
		ModelAndView mav = res.entrance(req, rb);
		return URLEncoder.encode(mav.getModel().get("ToHostReserveList2").toString(),"UTF-8");
	}
	
	@RequestMapping(value = "/OKStatus", method = RequestMethod.POST)
	@ResponseBody
	public String OKStatus(HttpServletRequest req, @ModelAttribute ReserveBean rb)throws UnsupportedEncodingException {
		ModelAndView mav = res.entrance(req, rb);
		return URLEncoder.encode(mav.getModel().get("ToHostReserveList1").toString(),"UTF-8");
	}
	//예약취소
	@RequestMapping(value = "/Cancel", method = RequestMethod.POST)
	@ResponseBody
	public String Cancel(HttpServletRequest req, @ModelAttribute ReserveBean rb)throws UnsupportedEncodingException {
		ModelAndView mav = res.entrance(req, rb);
		return URLEncoder.encode(mav.getModel().get("ToHostReserveList3").toString(),"UTF-8");
	}

	@RequestMapping(value = "/ViewStatus", method = RequestMethod.POST)
	public ModelAndView ViewStatus(HttpServletRequest req, @ModelAttribute ReserveBean rb) {
		return res.entrance(req, rb);
	}

	@RequestMapping(value = "/ChangeStatus", method = RequestMethod.POST)
	public ModelAndView ChangeStatus(HttpServletRequest req, @ModelAttribute ReserveBean rb) {
		return res.entrance(req, rb);
	}

}