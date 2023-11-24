package com.hyun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyun.dto.Criteria;
import com.hyun.domain.ReviewVO;

public interface ReviewMapper {

	void review_insert(ReviewVO vo);
	
	List<ReviewVO> list(@Param("prod_num")Integer prod_num, @Param("cri") Criteria cri); 	//criteria 에서 검색기능 사용안함. mapper에서만 param하고 서비스에서는 제거
	
	int listCount(Integer prod_num);
}
