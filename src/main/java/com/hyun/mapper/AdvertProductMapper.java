package com.hyun.mapper;

import java.util.List;

import com.hyun.domain.ProductVO;
import com.hyun.dto.Criteria;

public interface AdvertProductMapper {

	void prod_insert(ProductVO vo);
	
	List<ProductVO> prod_list(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
}
