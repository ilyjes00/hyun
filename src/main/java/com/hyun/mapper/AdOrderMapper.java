package com.hyun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyun.domain.OrderDetailInfoVO;
import com.hyun.domain.OrderDetailProductVO;
import com.hyun.domain.OrderVO;
import com.hyun.dto.Criteria;

public interface AdOrderMapper {
	
	List<OrderVO> order_list(@Param("cri")Criteria cri , @Param("start_date")String start_date, @Param("end_date")String end_date);
	
	int getTotalCount(@Param("cri")Criteria cri , @Param("start_date")String start_date, @Param("end_date")String end_date);
	
	List<OrderDetailInfoVO> orderDetailInfo1(Long ord_code);
	
	//기존클래스 OrderDetailVO prodcutVO 필드가있는 클래스 resultmap사용
	List<OrderDetailProductVO> orderDetailInfo2(Long ord_code);
	
	void order_product_delete(@Param("ord_code")Long ord_code, @Param("prod_num") Integer prod_num);


}
