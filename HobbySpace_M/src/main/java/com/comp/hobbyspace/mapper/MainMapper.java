package com.comp.hobbyspace.mapper;

import java.util.ArrayList;

import com.comp.hobbyspace.beans.MainBean;

public interface MainMapper {
	
	MainBean loadStarSpace(MainBean mb);
	MainBean loadReserveSpace(MainBean mb);
	MainBean loadZzimSpace(MainBean mb);
	ArrayList<MainBean> loadReview(MainBean mb);
	MainBean getSpaceCode1(MainBean mb);
	MainBean getSpaceCode2(MainBean mb);
	MainBean getSpaceCode3(MainBean mb);
}
