package com.hyun.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyun.domain.ProductVO;
import com.hyun.dto.Criteria;
import com.hyun.dto.PageDTO;
import com.hyun.service.UserProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@RequestMapping("/user/product/*")
@Controller
public class UserProductController {
	
	private final UserProductService userProductService;

	//매핑주소 1: /user/product/prod_list?cg_code=2차카테고리코드
	//매핑주소 2: /user/product/prod_list/2차카테고리 코드 (REST API 개발형태)
	/*
	@GetMapping("/prod_list")
	public void prod_list(Integer cg_code) throws Exception{
		
	}*/
	
	@GetMapping("/prod_list/{cg_code}")
	public void prod_list(Criteria cri,@PathVariable("cgt_code") Integer cgt_code, Model model) throws Exception{
		
		   
		   //10 -> 2
		    cri.setAmount(2);
		   
			List<ProductVO> prod_list = userProductService.prod_list(cgt_code, cri);
			
			//날짜폴더의 역슬래시를 슬래시로 바꾸는 작업, 역슬래시로 되어있는 정보가 스프링으로 보내는 요청데이터에 사용되면 에러발생.
			prod_list.forEach(vo -> {
				vo.setProd_up_folder(vo.getProd_up_folder().replace("\\", "/"));
			});
			
			model.addAttribute("prod_list", prod_list);
			
			int totalcount = userProductService.getTotalCount(cgt_code);
			model.addAttribute("pageMaker", new PageDTO(cri, totalcount));
	   }
	}

