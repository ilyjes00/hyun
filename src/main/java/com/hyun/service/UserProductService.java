package com.hyun.service;

import java.util.List;


import com.hyun.domain.ProductVO;
import com.hyun.dto.Criteria;

public interface UserProductService {
	List<ProductVO> prod_list(Integer cgt_code, Criteria cri);
	

	int getTotalCount(Integer cgt_code);
}
