package com.comp.hobbyspace.beans;

import lombok.Data;

@Data
public class ModifyBean {
	private String sCode; //서비스코드
	private String us_Id; //유저코드
	private String us_Input_Id; //유저아이디
	private String us_Nickname; //닉네임
	private String us_Mobile; //전화번호
	private String us_Email; //이메일

}
