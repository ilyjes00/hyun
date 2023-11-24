package com.hyun.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hyun.domain.ReviewVO;
import com.hyun.dto.Criteria;
import com.hyun.mapper.ReviewMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReviewServiceImpl implements ReviewService {
	
	private final ReviewMapper reviewMapper;

	@Override
	public void review_insert(ReviewVO vo) {
		// TODO Auto-generated method stub
		reviewMapper.review_insert(vo);
	}

	@Override
	public List<ReviewVO> list(Integer prod_num, Criteria cri) {
		// TODO Auto-generated method stub
		return reviewMapper.list(prod_num, cri);
	}

	@Override
	public int listCount(Integer prod_num) {
		// TODO Auto-generated method stub
		return reviewMapper.listCount(prod_num);
	}

	@Override
	public void delete(Long rew_num) {
		// TODO Auto-generated method stub
		reviewMapper.delete(rew_num);
	}

}
