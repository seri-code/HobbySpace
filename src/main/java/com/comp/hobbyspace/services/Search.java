package com.comp.hobbyspace.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.wiring.BeanConfigurerSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import com.comp.hobbyspace.beans.HamburgerBean;
import com.comp.hobbyspace.beans.SearchBean;
import com.comp.hobbyspace.beans.SpaceBean;
import com.comp.hobbyspace.mapper.SearchMapper;
import com.google.gson.Gson;

@Service
public class Search {
	@Autowired
	private SearchMapper scMapper;
	@Autowired
	private Gson gson;
	
	public ModelAndView entrance(SearchBean se) {
		ModelAndView mav = null;
		System.out.println("서치 엔트런스 도착");
		switch(se.getSCode()) {
		case "Search":
			mav = searchWordCtl(se);
			break;
		case "SearchCate":
			mav = searchCateCtl(se);
			break;
		case "SearchD":
			mav = SearchDCtl(se);
			break;
		default:
			break;
		}
		return mav;
	}

	private ModelAndView SearchDCtl(SearchBean se) {
		ModelAndView mav = new ModelAndView();
		se.setKeyword("상세검색");
		mav.addObject("keyword", se.getKeyword());
		mav.addObject("searchResult",gson.toJson(this.searchOptions(se)));
		System.out.println(gson.toJson(this.searchOptions(se)));
		mav.setViewName("searchResult");
		return mav;
	}

	// 키워드 검색
	private ModelAndView searchWordCtl(SearchBean se) {
		System.out.println("키워드 검색 컨트롤 메소드 도착");
		ModelAndView mav = new ModelAndView();
		System.out.println(se);
		String jsonData1 = gson.toJson(this.searchKeyword(se));
		mav.addObject("keyword", se.getKeyword());
		mav.addObject("searchResult",jsonData1);
		System.out.println(jsonData1);
		mav.setViewName("searchResult");
		return mav;
	}

	private ArrayList<SearchBean> searchKeyword(SearchBean se) {
		return scMapper.searchKeyword(se);
	}
	
	private ModelAndView searchCateCtl(SearchBean se) {
		System.out.println("카테고리 클릭 컨트롤 메소드 도착");
		ModelAndView mav = new ModelAndView();
		System.out.println(se);
		se.setKeyword(this.getCategoryName(se).getCtName());
		String jsonData1 = gson.toJson(this.searchKeyword(se));
		mav.addObject("keyword", se.getKeyword());
		mav.addObject("searchResult",jsonData1);
		System.out.println(jsonData1);
		mav.setViewName("searchResult");
		return mav;
	}
	
	private SearchBean getCategoryName(SearchBean se) {
		return scMapper.getCategoryName(se);
	}
	
	private ArrayList<SearchBean> searchOptions(SearchBean se){
		return scMapper.searchOptions(se);
	}

}
