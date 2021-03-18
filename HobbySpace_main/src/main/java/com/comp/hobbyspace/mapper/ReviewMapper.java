package com.comp.hobbyspace.mapper;

import com.comp.hobbyspace.beans.ReviewBean;

public interface ReviewMapper {

	ReviewBean selectResDetail(ReviewBean rb);
	ReviewBean selectResDetCode(ReviewBean rb);
	void insReview(ReviewBean rb);
	ReviewBean selectReview(ReviewBean rb);
	void deleteReview(ReviewBean rb);
	void editReview(ReviewBean rb);
}
