package com.comp.hobbyspace.mapper;

import java.util.ArrayList;

import com.comp.hobbyspace.beans.ReviewBean;

public interface ReviewMapper {

	ReviewBean selectResDetail(ReviewBean rb);
	ArrayList<ReviewBean> selectResDetCode(ReviewBean rb);
	int insReview(ReviewBean rb);
	ReviewBean selectReview(ReviewBean rb);
	int deleteReview(ReviewBean rb);
	int editReview(ReviewBean rb);
}
