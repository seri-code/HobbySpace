package com.comp.hobbyspace.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import com.comp.hobbyspace.beans.ModifyBean;
import com.comp.hobbyspace.mapper.ModifyMapper;
import com.google.gson.Gson;

@Service
public class Modify {
	@Autowired
	private ModifyMapper mapper;
	@Autowired
	Gson gson;
	public ModelAndView entrance(HttpServletRequest req, ModifyBean mb) {
		ModelAndView mav = null;
		switch (mb.getSCode()) {
		case "toManageProfile": //프로필변경 페이지 이동 및 로드
			mav = manageProfile(req, mb);
			break;
		case "editImg":
			mav = editImgCtl(mb);
			break;
		case "editNickname": //닉네임 변경
			mav = editNicknameCtl(mb);
			break;
		case "toEditEmail":
			mav = toEditEmailCtl(mb);
			break;
		case "editEmail": //이메일 변경
			mav = editEmailCtl(mb);
			break;
		case "toEditMobile":
			mav = toEditMobileCtl(mb);
			break;
		case "editMobile": //휴대폰 변경
			mav = editMobileCtl(mb);
			break;
		case "toExit":
			mav = toExitCtl(mb);
			break;
		case "exit":
			mav = exitCtl(mb);
			break;
		default:
			break;
		}
		return mav;
		
	}
	
	//프로필변경페이지 이동 및 로드
	private ModelAndView manageProfile(HttpServletRequest req, ModifyBean mb) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		mb.setUs_Id(session.getAttribute("accessInfo").toString());
		System.out.println(gson.toJson(selUsid(mb)));
		mav.addObject("UsInfo",gson.toJson(selUsid(mb))); //유저정보 셀렉트
		mav.setViewName("manageProfile");
		return mav;
	}

	private ModifyBean selUsid(ModifyBean mb) {
		return mapper.selUsid(mb);
		
	}

	//탈퇴
	private ModelAndView exitCtl(ModifyBean mb) {
//		addNonMember()
//		addNonSp()
//		updateRs()
//		leaveAl()
//		leaveZzim()
//		leaveRv()
//		leaveCa()
//		leaveSp()
//		exit()
		return null;
	}
	//탈퇴 페이지로 이동
	private ModelAndView toExitCtl(ModifyBean mb) {
		// TODO Auto-generated method stub
		return null;
	}
	//휴대폰 변경
	private ModelAndView editMobileCtl(ModifyBean mb) {
		ModelAndView mav = new ModelAndView();
		String message = "휴대폰이 변경되었습니다";
		if(editMobile(mb)) {
			mav.addObject("message",message);
		}
		mav.setViewName("jsonView"); // pom에서 jsonView 라이브러리 다운 and 서블릿 빈 설정
		return mav;
		
	}
	private boolean editMobile(ModifyBean mb) {
		return convertToBoolean(mapper.editMobile(mb));
	}

	//휴대폰 변경 페이지로 이동
	private ModelAndView toEditMobileCtl(ModifyBean mb) {
		//loadUserMobile()
		return null;
	}
	//이메일 변경
	private ModelAndView editEmailCtl(ModifyBean mb) {
		ModelAndView mav = new ModelAndView();
		String message = "이메일이 변경되었습니다";
		if(editEmail(mb)) {
			mav.addObject("message",message);
		}
		mav.setViewName("jsonView"); // pom에서 jsonView 라이브러리 다운 and 서블릿 빈 설정
		return mav;
	}
	private boolean editEmail(ModifyBean mb) {
		return convertToBoolean(mapper.editEmail(mb));
		
	}

	//이메일 변경페이지로 이동
	private ModelAndView toEditEmailCtl(ModifyBean mb) {
		//loadUserEmail()
		return null;
	}
	//닉네임변경
	private ModelAndView editNicknameCtl(ModifyBean mb) {
		ModelAndView mav = new ModelAndView();
		String message = "닉네임이 변경되었습니다";
		if(editNickname(mb)) {
			mav.addObject("message",message);
		}
		mav.setViewName("jsonView"); // pom에서 jsonView 라이브러리 다운 and 서블릿 빈 설정
		return mav;

	}
	private boolean editNickname(ModifyBean mb) {
		return convertToBoolean(mapper.editNickname(mb));
		
	}

	// 사진변경
	private ModelAndView editImgCtl(ModifyBean mb) {
		//editImg();
		return null;
	}
	
	private boolean convertToBoolean(int value) {
		return value > 0 ? true : false;

	}
}
