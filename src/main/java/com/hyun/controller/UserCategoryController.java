package com.hyun.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hyun.domain.CategoryVO;
import com.hyun.service.UserCategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

//bean : userCategoryController 생성및등록
@RequiredArgsConstructor
@Log4j
@RestController	//only ajax사용 jsp파일은 사용이안됨. jsp파일에서 사용하기 위한 데이터작업
@RequestMapping("/category/*")
public class UserCategoryController {

	private final UserCategoryService userCategoryService;
	
	   @ResponseBody
	   @GetMapping("/twoCategory/{cgt_parent_code}")
	   public ResponseEntity<List<CategoryVO>> twoCategory(@PathVariable("cgt_parent_code") Integer cgt_parent_code) throws Exception {
		   
		   
		   log.info("2차카테고리코드 : " + cgt_parent_code);
		   
		   ResponseEntity<List<CategoryVO>> entity = null;
		   
		   entity = new ResponseEntity<List<CategoryVO>> (userCategoryService.getTwoCategoryList(cgt_parent_code), HttpStatus.OK);
		   
		   //List<CategoryVO> list = adCategoryService.getSecondCategoryList(cg_parent_code)
		   //list 객체 -> json으로 변환하는
		   
		return entity;
	   }
	
}
