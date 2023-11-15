package com.hyun.service;

import java.util.List;

import com.hyun.domain.CategoryVO;

public interface AdCategoryService {

	List<CategoryVO> getOneCategoryList();
	
	List<CategoryVO> getTwoCategoryList(Integer cgt_parent_code);
	
	List<CategoryVO> getThreeCategoryList(Integer cgt_parent_code);
	
	CategoryVO get(Integer cgt_code);
}
