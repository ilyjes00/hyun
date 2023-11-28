package com.hyun.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hyun.domain.OrderVO;
import com.hyun.dto.Criteria;
import com.hyun.mapper.AdOrderMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdOrderServiceImpl implements AdOrderService {

	private final AdOrderMapper adOrderMapper;

	@Override
	public List<OrderVO> order_list(Criteria cri) {
		// TODO Auto-generated method stub
		return adOrderMapper.order_list(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return adOrderMapper.getTotalCount(cri);
	}
}
