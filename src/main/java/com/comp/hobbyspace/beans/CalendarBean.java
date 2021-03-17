package com.comp.hobbyspace.beans;

import lombok.Data;

@Data
public class CalendarBean {
	private String sCode; //서비스코드
	private String nDate; //휴무일
	private String [] nDates; //휴무일 배열
	private String finalD; //영업종료일
	private String sp_Code; //공간코드
	private String ctCode; //카테고리코드
	private String ctCate; //카테고리
	private String sp_name; //공간명
	private String sp_intro; //공간짧은글소개
	private String sp_text; //공간긴글소개
	private String sp_caution; //공간주의사항
	private String[] sp_cautions; //공간주의사항
	private String sp_addy1; //공간주소
	private String sp_addy2; //공간상세주소
	private int sp_price; //공간가격
	private String sp_topimg; //대표이미지
	private String sp_img; //이미지
	private String sp_mobile; //연락처
	private String sp_sns; //SNS배열
	private String[] sp_snss; //SNS배열
	private String sp_tag; //SNS배열
	private String[] sp_tags; //태그배열
	private String sp_ImgName; //공간 탑이미지이름
	private String sp_loadPath; //공간 탑이미지경로
	private String userId;
	private String userNickname;
	private String[] sp_ImgNames; //공간 이미지이름 배열
	private String sp_ImgName2; //공간 이미지이름
	private String[] sp_romms; //공간방번호
	private String sp_romm; //공간방번호
	private int[] sp_peopels; //공간최대수용
	private int sp_peopel; //공간최대수용

}