package com.comp.hobbyspace.beans;

import lombok.Data;

@Data
public class AuthBean {
	private String sCode;
	private String userId;
	private String userPw;
	private String userNickname;
	private String userEmail;
	private String userMobile;
	private int accessType;
	private String spCode;
	private String rvDate;
	private String rvText;
	private int rvStar;
	private String spImg;
	private String spLocation;
	private String rvNumber;
	private String tenDigit; // 로그인 시 사용자가 아이디로 입력한 값이 US_INPUT_ID일 때, US_ID를 이 변수에 담는다 us_pw
	private String us_pw; //암호화 패스워
}
