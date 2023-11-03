package com.hyun.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.hyun.controller.GlobalControllerAdvice;
import com.hyun.domain.CategoryVO;
import com.hyun.service.AdCategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


	@Log4j
	@RequiredArgsConstructor
	@ControllerAdvice(basePackages = {"com.hyun.controller"}) 
	public class GlobalControllerAdvice {

		private final AdCategoryService adCategoryService;
		
		@ModelAttribute
		public void getFirstCategoryList(Model model) {
			
			log.info("1차카테고리 리스트");
			
			List<CategoryVO> oneCategoryList = adCategoryService.getOneCategoryList();
			model.addAttribute("oneCategoryList", oneCategoryList);
		}
	}

	

