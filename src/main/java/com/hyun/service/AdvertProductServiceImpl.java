package com.hyun.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hyun.domain.ProductVO;
import com.hyun.dto.Criteria;
import com.hyun.mapper.AdvertProductMapper;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class AdvertProductServiceImpl implements AdvertProductService{

	
	private final AdvertProductMapper advertProductMapper;

	@Override
	public void prod_insert(ProductVO vo) {
		// TODO Auto-generated method stub
		advertProductMapper.prod_insert(vo);
	}

	@Override
	public List<ProductVO> prod_list(Criteria cri) {
		// TODO Auto-generated method stub
		return advertProductMapper.prod_list(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return advertProductMapper.getTotalCount(cri);
	}
}
