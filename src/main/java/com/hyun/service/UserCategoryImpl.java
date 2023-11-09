package com.hyun.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hyun.domain.CategoryVO;
import com.hyun.mapper.UserCategoryMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@Service	// bean이 생성등록될 설정작업 : userCategoryServiceImpl bean 생성. root-context.xml에서 	<context:component-scan base-package="com.docmall.service" /> 작업해야한다.
public class UserCategoryImpl implements UserCategoryService {
	
	private final UserCategoryMapper userCategoryMapper;
	
	@Override
	public List<CategoryVO> getTwoCategoryList(Integer cgt_parent_code) {
		// TODO Auto-generated method stub
		return userCategoryMapper.getTwoCategoryList(cgt_parent_code);
	}

}
