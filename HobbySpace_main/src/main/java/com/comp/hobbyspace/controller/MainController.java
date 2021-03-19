package com.comp.hobbyspace.controller;

import com.comp.hobbyspace.beans.MainBean;
import com.comp.hobbyspace.beans.ZzimBean;
import com.comp.hobbyspace.services.Main;
import com.comp.hobbyspace.services.Zzim;
import com.comp.hobbyspace.utils.ProjectUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired
	Main main;
	@Autowired
	Zzim zzim;
	
	ModelAndView mav = null;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView Main(@ModelAttribute MainBean mb) {
		return main.entrance(mb);
	}

	@RequestMapping(value = "/MoreReview", method = RequestMethod.GET)
	public ModelAndView MoreReview(@ModelAttribute MainBean mb) {
		return main.entrance(mb);
	}

	@RequestMapping(value = "/Zzim", method = RequestMethod.POST)
	public ModelAndView Zzim(HttpServletRequest req, @ModelAttribute ZzimBean zb) {
		return zzim.entrance(req, zb);
	}

	@RequestMapping(value = "/DeleteZzim", method = RequestMethod.POST)
	public ModelAndView DeleteZzim(HttpServletRequest req, @ModelAttribute ZzimBean zb) {
		return zzim.entrance(req, zb);
	}

}