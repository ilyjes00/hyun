package com.hyun.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyun.util.FileUtils;
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
	
	// 메인및썸네일 이미지 업로드 폴더경로 주입작업
	@Resource(name="uploadPath")	//servlet-context.xml의 bean이름 참조
	private String uploadPath;

	//매핑주소 1: /user/product/prod_list?cg_code=2차카테고리코드
	//매핑주소 2: /user/product/prod_list/2차카테고리 코드 (REST API 개발형태)
	/*
	@GetMapping("/prod_list")
	public void prod_list(Integer cg_code) throws Exception{
		
	}*/
	
	@GetMapping("/prod_list")
	public String prod_list(Criteria cri,@ModelAttribute("cgt_code") Integer cgt_code, @ModelAttribute("cgt_name")String cgt_name, Model model) throws Exception{
		
		   
		   //10 -> 2
		    cri.setAmount(8);
		   
			List<ProductVO> prod_list = userProductService.prod_list(cgt_code, cri);
			
			//날짜폴더의 역슬래시를 슬래시로 바꾸는 작업, 역슬래시로 되어있는 정보가 스프링으로 보내는 요청데이터에 사용되면 에러발생.
			prod_list.forEach(vo -> {
				vo.setProd_up_folder(vo.getProd_up_folder().replace("\\", "/"));
			});
			
			model.addAttribute("prod_list", prod_list);
			
			int totalcount = userProductService.getTotalCount(cgt_code);
			model.addAttribute("pageMaker", new PageDTO(cri, totalcount));
			
			return "/user/product/prod_list";
	}
			
			   //상품리스트에서 보여줄이미지, <img src="매핑주소">
			   @ResponseBody
			   @GetMapping("/imageDisplay")	///user/product/imageDisplay?dateFolderName=값1&fileName=값2
			   public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName)throws Exception {
				   
				   return FileUtils.getFile(uploadPath + dateFolderName, fileName);
	   }
	}

