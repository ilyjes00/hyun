package com.hyun.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hyun.mapper.AdCategoryMapper;
import com.hyun.domain.CategoryVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@Service
public class AdCategoryServiceImpl implements AdCategoryService {
	
	private final AdCategoryMapper adCategoryMapper;

	@Override
	public List<CategoryVO> getOneCategoryList() {
		// TODO Auto-generated method stub
		return adCategoryMapper.getOneCategoryList();
	}

	@Override
	public List<CategoryVO> getTwoCategoryList(Integer cgt_parent_code) {
		// TODO Auto-generated method stub
		return adCategoryMapper.getTwoCategoryList(cgt_parent_code);
	}

}
