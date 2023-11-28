package com.hyun.mapper;

import java.util.List;

import com.hyun.domain.OrderVO;
import com.hyun.dto.Criteria;

public interface AdOrderMapper {
	
	List<OrderVO> order_list(Criteria cri);
	
	int getTotalCount(Criteria cri);

}
