package com.comp.hobbyspace.mapper;

import java.util.ArrayList;

import com.comp.hobbyspace.beans.HamburgerBean;

public interface HamburgerMapper {
	
	public ArrayList<HamburgerBean> loadGReserveList(HamburgerBean hb);
	public ArrayList<HamburgerBean> loadGReviewList(HamburgerBean hb);
	public ArrayList<HamburgerBean> loadZzimList(HamburgerBean hb);
	public ArrayList<HamburgerBean> loadSpaceList(HamburgerBean hb);
}
