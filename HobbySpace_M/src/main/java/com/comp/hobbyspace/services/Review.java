package com.comp.hobbyspace.services;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.comp.hobbyspace.beans.AttachFileDTO;
import com.comp.hobbyspace.beans.HamburgerBean;
import com.comp.hobbyspace.beans.ReviewBean;
import com.comp.hobbyspace.mapper.ReviewMapper;
import com.comp.hobbyspace.utils.ProjectUtils;
import com.google.gson.Gson;

import net.coobird.thumbnailator.Thumbnailator;

@Service
public class Review {
	@Autowired
	private ReviewMapper rvMapper;
	@Autowired
	private Gson gson;
	@Autowired
	private ProjectUtils pu;
	@Autowired
	private PlatformTransactionManager tran;
	
	public ModelAndView entrance(HttpServletRequest req, ReviewBean rb) {
		ModelAndView mav = null;
		switch (rb.getSCode()) {
		case "ToNewReview": //리뷰이동
			mav = this.toNewReviewCtl(rb);
			break;
		case "NewReview":
			mav = this.newReviewCtl(rb);
			break;
		case "ToEditReview":
			mav = this.toEditReviewCtl(rb);
			break;
		case "EditReview":
			mav = this.editReviewCtl(rb);
		case "DeleteReview":
			mav = this.deleteReviewCtl(rb);

		}
		return mav;
	}

	// 이미지 처리 엔트랑스
	public ModelAndView entrance(MultipartFile[] uploadFile, ReviewBean rb) {
		ModelAndView mav = null;
		return mav = this.ReviewImg(uploadFile, rb);
	}

	private ModelAndView ReviewImg(MultipartFile[] uploadFile, ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		System.out.println(rb.getRdCode());
		// 서버pc 이미지저장 장소
		String uploadFolder = "D:\\Spring\\HobbySpace\\HobbySpace_main\\src\\main\\webapp\\resources\\images\\rvimg";

		
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
	private ModelAndView toNewReviewCtl(ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("reserve",gson.toJson(rb));
		System.out.println(gson.toJson(rb));
		
		mav.setViewName("reviewEditor");
		return mav;
	}

	// 신규후기 작성
	private ModelAndView newReviewCtl(ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
		try {
			rb.setUsId(pu.getAttribute("usId").toString());
			this.insReview(rb); //인서트 실행
			tran.commit(status);
		} catch (Exception e) {
			tran.rollback(status);
			e.printStackTrace();
		}



		mav.addObject("sCode","3");
		mav.setViewName("redirect:/ToReviewList");
		return mav;
	}
	
	//인서트 리뷰
	private boolean insReview(ReviewBean rb) {
		return convertToBoolean(rvMapper.insReview(rb));
	}

	// 후기 수정으로 이동
	private ModelAndView toEditReviewCtl(ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		try {
			rb.setUsId(pu.getAttribute("usId").toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.addObject("reserve", gson.toJson(this.selectReview(rb)));
		mav.setViewName("reviewEditor");
		return mav;
	}

	private ReviewBean selectReview(ReviewBean rb) {
		return rvMapper.selectReview(rb);
	}

	// 후기 수정
	private ModelAndView editReviewCtl(ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		try {
			rb.setUsId(pu.getAttribute("usId").toString());
			System.out.println("리뷰수정진입");
			System.out.println(rb);
			System.out.println(this.editReview(rb));
			System.out.println(gson.toJson(this.selectReview(rb)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mav.addObject("sCode","3");
		mav.setViewName("redirect:/ToReviewList");
		return mav;
	}

	private boolean editReview(ReviewBean rb) {
		return convertToBoolean(rvMapper.editReview(rb));
	}

	// 후기 삭제
	private ModelAndView deleteReviewCtl(ReviewBean rb) {
		ModelAndView mav = new ModelAndView();
		try {
			rb.setUsId(pu.getAttribute("usId").toString());
			this.deleteReview(rb);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("sCode","3");
		mav.setViewName("redirect:/ToReviewList");
		return mav;
	}

	private boolean deleteReview(ReviewBean rb) {
		return convertToBoolean(rvMapper.deleteReview(rb));
	}
	
	private boolean convertToBoolean(int value) {
		return value > 0 ? true : false;

	}
}