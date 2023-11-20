package com.hyun.service;

import com.hyun.domain.OrderVO;
import com.hyun.domain.PaymentVO;

public interface OrderService {
	
	
	int getOrderSeq();
	
	//주문하기
	void order_insert(OrderVO o_vo, PaymentVO vo);

}
