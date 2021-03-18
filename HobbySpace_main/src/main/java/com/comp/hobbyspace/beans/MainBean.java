package com.comp.hobbyspace.beans;

import lombok.Data;

@Data
public class MainBean {
	private String sCode;
	private String spCode;
	private String rvDate;
	private String rvText;
	private int rvStar;
	private String spImg;
	private String spLocation;
	private String rvNumber; // 공간의 예약 수
	private String rvImg;
}
