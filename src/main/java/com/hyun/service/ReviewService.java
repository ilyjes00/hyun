package com.hyun.service;

import java.util.List;

import com.hyun.dto.Criteria;
import com.hyun.domain.ReviewVO;

public interface ReviewService {

	void review_insert(ReviewVO vo);
	
	List<ReviewVO> list(Integer prod_num, Criteria cri);
	
	int listCount(Integer prod_num);
	
	void delete(Long rew_num);
}
