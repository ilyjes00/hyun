package com.hyun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyun.domain.CategoryVO;
import com.hyun.domain.ProductVO;
import com.hyun.dto.Criteria;
import com.hyun.dto.ProductDTO;

public interface AdvertProductMapper {

	void prod_insert(ProductVO vo);
	
	List<ProductVO> prod_list(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
	void prod_checked_modify1(
			@Param("prod_num") Integer prod_num,
			@Param("prod_price") Integer prod_price,
			@Param("prod_buy") String prod_buy
			);
	void prod_checked_modify2(List<ProductDTO> prod_modify_list);
	
	ProductVO prod_edit(Integer prod_num);
	
	//상품수정
	void prod_edit_ok(ProductVO vo);

	//상품삭제
	void prod_delete(Integer prod_num);
}
