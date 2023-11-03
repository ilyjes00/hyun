package com.hyun.service;

import java.util.List;

import com.hyun.dto.Criteria;
import com.hyun.domain.ProductVO;

public interface AdvertProductService {

	void prod_insert(ProductVO vo);
	
	List<ProductVO> prod_list(Criteria cri);
	
	int getTotalCount(Criteria cri);
}
