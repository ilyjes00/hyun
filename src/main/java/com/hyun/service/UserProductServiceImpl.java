package com.hyun.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hyun.domain.ProductVO;
import com.hyun.dto.Criteria;
import com.hyun.mapper.UserProductMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserProductServiceImpl implements UserProductService {

	private UserProductMapper userProductMapper;
	
	@Override
	public List<ProductVO> prod_list(Integer cgt_code, Criteria cri) {
		// TODO Auto-generated method stub
		return userProductMapper.prod_list(cgt_code, cri);
	}

	@Override
	public int getTotalCount(Integer cgt_code) {
		// TODO Auto-generated method stub
		return userProductMapper.getTotalCount(cgt_code);
	}

}
