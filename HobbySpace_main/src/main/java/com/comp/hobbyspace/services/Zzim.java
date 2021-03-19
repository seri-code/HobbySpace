package com.comp.hobbyspace.services;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.comp.hobbyspace.beans.ReserveBean;
import com.comp.hobbyspace.beans.ZzimBean;
import com.comp.hobbyspace.mapper.ZzimMapper;

@Service
public class Zzim {

	@Autowired
	private ZzimMapper zzMapper;

	// 리퀘스트 매핑값(sCode에 담은 값)에 따라 백엔드 분기하는 메소드
	public ModelAndView entrance(HttpServletRequest req, ZzimBean zb) {
		ModelAndView mav = null;
		switch (zb.getSCode()) {
		case "Zzim":
			mav = this.zzimCtl(req, zb);
			break;
		case "DeleteZzim":
			mav = this.deleteZzimCtl(req, zb);
			break;
		default:
			break;
		}
		return mav;
	}

	// 찜 insert 컨트롤 메소드
	private ModelAndView zzimCtl(HttpServletRequest req, ZzimBean zb) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		if (session.getAttribute("accessInfo") == null) {
			mav.setViewName("logInForm");
		}else {
			zb.setUserId(session.getAttribute("accessInfo").toString());
			// 찜 추가
			
			this.zzim(zb);
			
			mav.setViewName("redirect: /ToZzimList?sCode=4&userId=" + zb.getUserId());
		}
		return mav;
	}

	// 찜 delete 컨트롤 메소드
	private ModelAndView deleteZzimCtl(HttpServletRequest req, ZzimBean zb) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		if (session.getAttribute("accessInfo") == null) {
			mav.setViewName("logInForm");
		}else {
			zb.setUserId(session.getAttribute("accessInfo").toString());
			// 찜 추가
			this.deleteZzim(zb);
			mav.setViewName("redirect: /ToZzimList?sCode=4&userId=" + zb.getUserId());
		}

		return mav;
	}

	// 특정 공간을 찜에 insert하는 메소드
	private void zzim(ZzimBean zb) {
		zzMapper.zzim(zb);
	}

	// 특정 공간을 찜에서 delete하는 메소드
	private int deleteZzim(ZzimBean zb) {
		return zzMapper.deleteZzim(zb);
	}
}