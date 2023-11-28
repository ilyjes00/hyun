package com.hyun.service;

import java.util.List;

import com.hyun.domain.OrderVO;
import com.hyun.dto.Criteria;

public interface AdOrderService {
	
	List<OrderVO> order_list(Criteria cri);
	
	int getTotalCount(Criteria cri);
}
