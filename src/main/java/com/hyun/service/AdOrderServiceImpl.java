package com.hyun.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hyun.domain.OrderDetailInfoVO;
import com.hyun.domain.OrderDetailProductVO;
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

	@Override
	public List<OrderDetailInfoVO> orderDetailInfo1(Long ord_code) {
		// TODO Auto-generated method stub
		return adOrderMapper.orderDetailInfo1(ord_code);
	}

	@Override
	public List<OrderDetailProductVO> orderDetailInfo2(Long ord_code) {
		// TODO Auto-generated method stub
		return adOrderMapper.orderDetailInfo2(ord_code);
	}

	@Override
	public void order_product_delete(Long ord_code, Integer prod_num) {
		// TODO Auto-generated method stub
		adOrderMapper.order_product_delete(ord_code, prod_num);
	}
}
