package com.comp.hobbyspace.beans;

import lombok.Data;

@Data
public class ReviewBean {
	private String sCode;
	private String usId; //유저아이디
	private String rdCode; //예약상세코드
	private String rdSpCode; //리뷰공간코드
	private String rdRoom; //리뷰방번호
	private String rvImg; //이미지이름
	private int rvstar; //리뷰별점
	private String rvtext; //리뷰내용
	private String rvcontent;
}
