package com.comp.hobbyspace.controller;

import com.comp.hobbyspace.beans.AttachFileDTO;
import com.comp.hobbyspace.beans.SearchBean;
import com.comp.hobbyspace.beans.SpaceBean;
import com.comp.hobbyspace.services.Search;
import com.comp.hobbyspace.services.Space;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	@Autowired
	Search sc;
	@Autowired
	Space sp;

	ModelAndView mav = null;

	// 단어 검색
	@RequestMapping(value = "/Search", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView search(@ModelAttribute SearchBean se) {
		System.out.println("컨트롤러 도착");
		return sc.entrance(se);
	}

	// 상세검색
	@RequestMapping(value = "/SearchD", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchD(@ModelAttribute SearchBean se) {
		se.setSCode("SearchD");
		System.out.println("상세컨트롤러 도착");
		return sc.entrance(se);
	}

	// 카테고리 검색
	@RequestMapping(value = "/SearchCate", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchCate(@ModelAttribute SearchBean se) {
		System.out.println("컨트롤러 도착");
		return sc.entrance(se);
	}

	// 공간상세페이지 이동 및 로드
	@RequestMapping(value = "/SpaceDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView SpaceDetail(@ModelAttribute SpaceBean sb) {
		return sp.entrance(sb);
	}

	// 공간등록페이지 이동 및 로드
	@RequestMapping(value = "/ToInputSpace", method = RequestMethod.POST)
	public ModelAndView ToInputSpace(@ModelAttribute SpaceBean sb) {
		return sp.entrance(sb);
	}

	// 공간대표이미지 처리 컨트롤러
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadTopimg(MultipartFile[] uploadFile, String name) {
		return sp.entrance(uploadFile, name);
	}

	// 공간이미지 처리 컨트롤러
	@PostMapping(value = "/uploadImg", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadImg(MultipartFile[] uploadFile2, String name, String spCode) {
		String imgName = spCode + "_" + name;
		return sp.entrance(uploadFile2, imgName);

	}
}
