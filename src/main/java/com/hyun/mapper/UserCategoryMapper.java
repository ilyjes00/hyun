package com.hyun.mapper;

import java.util.List;

import com.hyun.domain.CategoryVO;

public interface UserCategoryMapper {

	List<CategoryVO> getTwoCategoryList(Integer cgt_parent_code);
	
}
