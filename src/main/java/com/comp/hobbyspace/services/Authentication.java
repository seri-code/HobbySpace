package com.comp.hobbyspace.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.comp.hobbyspace.beans.AuthBean;
import com.comp.hobbyspace.mapper.AuthMapper;

@Service
public class Authentication {
	@Autowired
	private AuthMapper auMapper;

	public ModelAndView entrance(HttpServletRequest req, AuthBean ab) {
		System.out.println("auth 엔트런스 진입");
		ModelAndView mav = null;
		switch (ab.getSCode()) {
		case "LogIn":
			mav = this.logInCtl(req, ab);
			break;
		case "LogOut":
			mav = this.logOutCtl(req, ab);
			break;
		case "ToJoin":
			mav = this.toJoinCtl(ab);
			break;
		case "Join":
			mav = this.joinCtl(req, ab);
			break;
		}
		return mav;
	}

	// 로그인(logInForm.jsp에서 로그인 버튼 클릭)
	public ModelAndView logInCtl(HttpServletRequest req, AuthBean ab) {
		System.out.println("여기는 로그인ctl");
		ModelAndView mav = new ModelAndView();
		System.out.println(ab.getUserId());
		try {
			if (this.isUserId(ab)) {
				System.out.println("사용자가 입력한 값이 PK임");
				if (!this.isAccess(ab)) {
					System.out.println("접속중 아님 확인");
					ab.setAccessType(1);
					if (this.insAccess(ab)) {
						System.out.println("접속기록 insert");
						HttpSession session = req.getSession();
						System.out.println(ab.getUserId());
						session.setAttribute("accessInfo", ab.getUserId());
						session.setAttribute("nickname", this.getUserNickname(ab).getUserNickname());
						mav.addObject("nickname", session.getAttribute("nickname"));
						mav.addObject("accessInfo", session.getAttribute("accessInfo"));
						mav.setViewName("redirect:/");
					}
				}

			} else if(this.isMember(ab)){
				System.out.println("사용자가 입력한 값이 PK가 아닌 INPUT_ID임");
				ab.setUserId(this.selectDigit(ab).getTenDigit());
				if (!this.isAccess(ab)) {
					System.out.println("접속중 아님 확인");
					ab.setAccessType(1);
					if (this.insAccess(ab)) {
						System.out.println("접속기록 insert");
						HttpSession session = req.getSession();
						session.setAttribute("accessInfo", ab.getUserId());
						session.setAttribute("nickname", this.getUserNickname(ab).getUserNickname());
						mav.addObject("nickname", session.getAttribute("nickname"));
						mav.addObject("accessInfo", session.getAttribute("accessInfo"));
						mav.setViewName("redirect:/");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	private boolean isUserId(AuthBean ab) {
		return this.convertToBoolean(auMapper.isUserId(ab));
	}

	// 회원이 입력한 ID로 10자리 숫자 회원번호 조회
	private AuthBean selectDigit(AuthBean ab) {
		return auMapper.selectDigit(ab);
	}

	// 로그아웃(햄버거 메뉴에서 로그아웃 버튼 클릭)
	private ModelAndView logOutCtl(HttpServletRequest req, AuthBean ab) {
		System.out.println("로그아웃ctl 진입");
		ModelAndView mav = new ModelAndView();
		ab.setAccessType(-1);
		HttpSession session = req.getSession();
		// 세션에 로그인정보 있는지 확인
		if (session.getAttribute("accessInfo") != null) {
			System.out.println(session.getAttribute("accessInfo").toString());
			// AuthBean의 userId를 세션의 로그인 정보로 설정
			ab.setUserId(session.getAttribute("accessInfo").toString());
			// 현재 접속중 확인
			if (this.isAccess(ab)) {
				System.out.println("현재 접속중 확인");
				// 로그아웃 기록 insert
				if (this.insAccess(ab)) {
					System.out.println("로그아웃 기록 insert");
					// 기존 세션 무효화
					session.invalidate();
					// 새로운 세션 발급
					req.getSession(true);
					mav.setViewName("redirect:/");
				}
			}
		}

		return mav;
	}

	// 회원가입으로 이동(logInForm.jsp에서 회원가입 버튼 클릭)
	private ModelAndView toJoinCtl(AuthBean ab) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("join");
		return mav;
	}

	// 회원가입(join.jsp에서 확인 버튼 클릭)
	private ModelAndView joinCtl(HttpServletRequest req, AuthBean ab) {
		ModelAndView mav = new ModelAndView();
		System.out.println("여기는 조인ctl");
		ab.setAccessType(1);
		try {
			if (!this.isMember(ab)) {
				if (this.insUser(ab)) {
					ab.setUserId(this.selectDigit(ab).getTenDigit());
					System.out.println(ab);
					if (this.insAccess(ab)) {
						HttpSession session = req.getSession();
						session.setAttribute("accessInfo", ab.getUserId());
						session.setAttribute("nickname", ab.getUserNickname());
						mav.addObject("nickname", session.getAttribute("nickname"));
						mav.addObject("accessInfo", session.getAttribute("accessInfo"));
						mav.setViewName("redirect:/");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	private AuthBean getUserNickname(AuthBean ab) {
		return auMapper.getUserNickname(ab);
	}

	private boolean convertToBoolean(int value) {
		return value == 1 ? true : false;

	}

	private boolean isMember(AuthBean ab) {
		return convertToBoolean(auMapper.isMember(ab));
	}

	private boolean isAccess(AuthBean ab) {
		Integer in = auMapper.isAccess(ab);
		if (in == null) {
			in = 0;
		}
		return convertToBoolean(in);
	}

	public boolean insAccess(AuthBean ab) {
		return convertToBoolean(auMapper.insAccess(ab));
	}

	private boolean insUser(AuthBean ab) {
		return convertToBoolean(auMapper.insUser(ab));
	}

}
