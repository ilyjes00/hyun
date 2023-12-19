package com.hyun.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.hyun.domain.OrderDetailInfoVO;
import com.hyun.domain.OrderDetailProductVO;
import com.hyun.domain.OrderVO;
import com.hyun.dto.Criteria;

public interface AdOrderService {
	
	List<OrderVO> order_list(Criteria cri, String start_date ,String end_date);
	
	int getTotalCount(Criteria cri, String start_date ,String end_date);
	
	List<OrderDetailInfoVO> orderDetailInfo1(Long ord_code);
	
	List<OrderDetailProductVO> orderDetailInfo2(Long ord_code);
	
	void order_product_delete(Long ord_code, Integer prod_num);
	
	
	void getReserveExcel(OrderVO OrderVO,HttpServletRequest request,HttpServletResponse response)throws Exception;
}
