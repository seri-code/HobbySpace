package com.comp.hobbyspace.mapper;

import java.util.ArrayList;

import com.comp.hobbyspace.beans.SearchBean;
import com.comp.hobbyspace.beans.SpaceBean;

public interface SearchMapper {
	
	public ArrayList<SearchBean> searchOptions(SearchBean sb);
	public ArrayList<SearchBean> searchKeyword(SearchBean sb);
	public SearchBean getCategoryName(SearchBean se);
}
