package com.hyun.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyun.domain.CategoryVO;
import com.hyun.service.AdCategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/admin/category/*")
@RequiredArgsConstructor
@Log4j
@Controller
public class AdCategoryController {

	private final AdCategoryService adCategoryService;
	
	   @ResponseBody
	   @GetMapping("/twoCategory/{cgt_parent_code}")
	   public ResponseEntity<List<CategoryVO>> twoCategory(@PathVariable("cgt_parent_code") Integer cgt_parent_code) throws Exception {
		   
		   
		   log.info("1차카테고리코드 : " + cgt_parent_code);
		   
		   ResponseEntity<List<CategoryVO>> entity = null;
		   
		   entity = new ResponseEntity<List<CategoryVO>> (adCategoryService.getTwoCategoryList(cgt_parent_code), HttpStatus.OK);
		   
		   //<List<CategoryVO> list = 
		   
		return entity;
	   }
	   
	   @ResponseBody
	   @GetMapping("/threeCategory/{cgt_parent_code}")
	   public ResponseEntity<List<CategoryVO>> threeCategory(@PathVariable("cgt_parent_code") Integer cgt_parent_code) throws Exception {
		   
		   
		   log.info("2차카테고리코드 : " + cgt_parent_code);
		   
		   ResponseEntity<List<CategoryVO>> entity = null;
		   
		   entity = new ResponseEntity<List<CategoryVO>> (adCategoryService.getThreeCategoryList(cgt_parent_code), HttpStatus.OK);
		   
		   //<List<CategoryVO> list = 
		   
		return entity;
	   }
	
	
}
