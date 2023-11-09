package com.hyun.service;

import java.util.List;

import com.hyun.domain.CategoryVO;

public interface UserCategoryService {

	List<CategoryVO> getTwoCategoryList(Integer cgt_parent_code);
}
