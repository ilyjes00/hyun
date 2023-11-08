package com.hyun.mapper;

import java.util.List;

import com.hyun.domain.CategoryVO;

public interface AdCategoryMapper {

	List<CategoryVO> getOneCategoryList();
	
	List<CategoryVO> getTwoCategoryList(Integer cgt_parent_code);
	
	CategoryVO get(Integer cgt_code);
}
