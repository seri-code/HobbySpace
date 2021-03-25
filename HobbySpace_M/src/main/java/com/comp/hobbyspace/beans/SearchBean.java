package com.comp.hobbyspace.beans;

import lombok.Data;

@Data
public class SearchBean {
	private String sCode;
	private String spPrice;
	private String spTag;
	private String spCode;
	private String spImg;
	private String spName;
	private String spLocation; //주소
	private String keyword;
	private String ctCode; //카테고리토드
	private String ctName; // 카테고리 이름(DB상 칼럼명은 CT_CATE)
	private int maxPeople;  //최대수용인구
	private String seDate;  //검색날짜
}
