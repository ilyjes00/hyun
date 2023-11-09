package com.hyun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyun.domain.ProductVO;
import com.hyun.dto.Criteria;

public interface UserProductMapper {

	List<ProductVO> prod_list(@Param("cgt_code") Integer cgt_code, @Param("cri") Criteria cri);

	int getTotalCount(Integer cgt_code);
}
