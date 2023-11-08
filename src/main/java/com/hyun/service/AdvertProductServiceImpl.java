package com.hyun.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hyun.domain.CategoryVO;
import com.hyun.domain.ProductVO;
import com.hyun.dto.Criteria;
import com.hyun.dto.ProductDTO;
import com.hyun.mapper.AdvertProductMapper;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class AdvertProductServiceImpl implements AdvertProductService{

	
	private final AdvertProductMapper advertProductMapper;

	@Override
	public void prod_insert(ProductVO vo) {
		// TODO Auto-generated method stub
		advertProductMapper.prod_insert(vo);
	}

	@Override
	public List<ProductVO> prod_list(Criteria cri) {
		// TODO Auto-generated method stub
		return advertProductMapper.prod_list(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return advertProductMapper.getTotalCount(cri);
	}

	@Override
	public void prod_checked_modify1(List<Integer> prod_num_arr, List<Integer> prod_price_arr,
			List<String> prod_buy_arr) {
		for(int i=0; i<prod_num_arr.size(); i++) {
			advertProductMapper.prod_checked_modify1(prod_num_arr.get(i), prod_price_arr.get(i), prod_buy_arr.get(i));
		}
	}

	@Override
	public void prod_checked_modify2(List<Integer> prod_num_arr, List<Integer> prod_price_arr, List<String> prod_buy_arr) {
		List<ProductDTO> prod_modify_list = new ArrayList<ProductDTO>();
		
		for(int i=0; i<prod_num_arr.size(); i++) {
			ProductDTO productDTO = new ProductDTO(prod_num_arr.get(i), prod_price_arr.get(i), prod_buy_arr.get(i));
			prod_modify_list.add(productDTO);
		}
		
		advertProductMapper.prod_checked_modify2(prod_modify_list);
		
	}

	@Override
	public ProductVO prod_edit(Integer prod_num) {
		// TODO Auto-generated method stub
		return advertProductMapper.prod_edit(prod_num);
	}

	@Override
	public void prod_edit(ProductVO vo) {
		// TODO Auto-generated method stub
		advertProductMapper.prod_edit_ok(vo);
	}

	@Override
	public void prod_delete(Integer prod_num) {
		// TODO Auto-generated method stub
		advertProductMapper.prod_delete(prod_num);
	}


}
