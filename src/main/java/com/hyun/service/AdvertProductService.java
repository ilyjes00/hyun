package com.hyun.service;

import java.util.List;

import com.hyun.dto.Criteria;
import com.hyun.domain.CategoryVO;
import com.hyun.domain.ProductVO;

public interface AdvertProductService {

	void prod_insert(ProductVO vo);
	
	List<ProductVO> prod_list(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
	void prod_checked_modify1(List<Integer> prod_num_arr, List<Integer> prod_price_arr, List<String> prod_buy_arr);

	void prod_checked_modify2(List<Integer> prod_num_arr, List<Integer> prod_price_arr, List<String> prod_buy_arr);

	ProductVO prod_edit(Integer prod_num);
	
	void prod_edit(ProductVO vo);
	
	void prod_delete(Integer prod_num);
}
