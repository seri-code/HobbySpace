package com.comp.hobbyspace.services;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.comp.hobbyspace.beans.AttachFileDTO;
import com.comp.hobbyspace.beans.ReviewBean;
import com.comp.hobbyspace.mapper.ReviewMapper;
import com.google.gson.Gson;

import net.coobird.thumbnailator.Thumbnailator;

@Service
public class Review {
	@Autowired
	private ReviewMapper rvMapper;
	@Autowired
	private Gson gson;

	public ModelAndView entrance(HttpServletRequest req, ReviewBean rb) {
		System.out.println("리뷰 엔트런스 진입");
		ModelAndView mav = null;
		switch (rb.getSCode()) {
		case "ToNewReview": //리뷰이동
			mav = this.toNewReviewCtl(req, rb);
			break;
		case "NewReview":
			mav = this.newReviewCtl(req, rb);
			break;
		case "ToEditReview":
			mav = this.toEditReviewCtl(req, rb);
			break;
		case "EditReview":
			mav = this.editReviewCtl(req, rb);
		case "DeleteReview":
			mav = this.deleteReviewCtl(req, rb);

		}
		return mav;
	}

	// 이미 처리 엔트랑스
	public ModelAndView entrance(MultipartFile[] uploadFile, ReviewBean rb) {
		ModelAndView mav = null;
		return mav = this.ReviewImg(uploadFile, rb);
	}

	private ModelAndView ReviewImg(MultipartFile[] uploadFile, ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		System.out.println(rb.getRdCode());
		// 서버pc 이미지저장 장소
		String uploadFolder = "C:\\Users\\Sigoto471\\git\\HobbySpace\\HobbySpace_M\\src\\main\\webapp\\resources\\images\\rvimg\\";

		
		String uuid = UUID.randomUUID().toString().replace("-", "").substring(0, 10);
		for (MultipartFile multipartFile : uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			System.out.println("공간원본이름 : " + uploadFileName);
			String[] name = uploadFileName.split("\\.");
			String spImgName = rb.getRdCode()+"_" + uuid + "." + name[name.length - 1];

			System.out.println(spImgName); //바뀐이름
			try {
				rb.setRvImg(spImgName);// 공간이미지이름
				System.out.println(uploadFolder); // 로컬 공간이미지 경로

				FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder, spImgName));

				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 600, 450);

				thumbnail.close();

				// add to list

			} catch (Exception e) {
				e.printStackTrace();
			}
			mav.addObject("rvimg",rb.getRvImg());
			mav.setViewName("jsonView");
		} // end for
		return mav;
	}
	// 신규후기작성으로 이동
	private ModelAndView toNewReviewCtl(HttpServletRequest req, ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("reserve",gson.toJson(rb));
		System.out.println(gson.toJson(rb));
		mav.setViewName("reviewEditor");
		return mav;
	}
	private ReviewBean selectResDetCode(ReviewBean rb) {
		return rvMapper.selectResDetCode(rb);
	}
	// 신규후기 작성
	private ModelAndView newReviewCtl(HttpServletRequest req, ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		rb.setUsId(session.getAttribute("accessInfo").toString());


		// 인서트 실행
		this.insReview(rb);
		mav.setViewName("reviewList");
		return mav;
	}

	private void insReview(ReviewBean rb) {
		rvMapper.insReview(rb);
	}

	// 후기 수정으로 이동
	private ModelAndView toEditReviewCtl(HttpServletRequest req, ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("review", this.selectReview(rb));
		mav.setViewName("reviewEditor");
		return mav;
	}

	private ReviewBean selectReview(ReviewBean rb) {
		return rvMapper.selectReview(rb);
	}

	// 후기 수정
	private ModelAndView editReviewCtl(HttpServletRequest req, ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		this.editReview(rb);
		mav.setViewName("reviewList");
		return mav;
	}

	private void editReview(ReviewBean rb) {
		rvMapper.editReview(rb);
	}

	// 후기 삭제
	private ModelAndView deleteReviewCtl(HttpServletRequest req, ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		this.deleteReview(rb);
		return mav;
	}

	private void deleteReview(ReviewBean rb) {
		rvMapper.deleteReview(rb);
	}
}