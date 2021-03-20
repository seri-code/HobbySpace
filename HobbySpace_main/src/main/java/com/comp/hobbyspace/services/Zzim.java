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
import com.comp.hobbyspace.utils.ProjectUtils;

@Service
public class Zzim {

	@Autowired
	private ZzimMapper zzMapper;
	@Autowired
	private ProjectUtils pu;
	
	// 리퀘스트 매핑값(sCode에 담은 값)에 따라 백엔드 분기하는 메소드
	public ModelAndView entrance(HttpServletRequest req, ZzimBean zb) {
		ModelAndView mav = null;
		switch (zb.getSCode()) {
		case "Zzim":
			mav = this.zzimCtl(zb);
			break;
		case "DeleteZzim":
			mav = this.deleteZzimCtl(zb);
			break;
		default:
			break;
		}
		return mav;
	}

	// 찜 insert 컨트롤 메소드
	private ModelAndView zzimCtl(ZzimBean zb) {
		ModelAndView mav = new ModelAndView();
		
		try {
			if (pu.getAttribute("usId") == null) {
				mav.setViewName("logInForm");
			}else {
				zb.setUserId(pu.getAttribute("usId").toString());
				// 찜 추가
				
				this.zzim(zb);
				
				mav.setViewName("redirect: /ToZzimList?sCode=4");
			}
		} catch (Exception e) {
			mav.setViewName("redirect: /ToZzimList?sCode=4"); //이미 존재하는 찜
			e.printStackTrace();
		}
		return mav;
	}

	// 찜 delete 컨트롤 메소드
	private ModelAndView deleteZzimCtl(ZzimBean zb) {
		ModelAndView mav = new ModelAndView();
		try {
			if (pu.getAttribute("usId") == null) {
				mav.setViewName("logInForm");
			}else {
				zb.setUserId(pu.getAttribute("usId").toString());
				// 찜 추가
				this.deleteZzim(zb);
				mav.setViewName("redirect: /ToZzimList?sCode=4");
			}
		} catch (Exception e) {
			mav.setViewName("redirect: /ToZzimList?sCode=4"); //존재하지않는 찜
			e.printStackTrace();
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