package com.hyun.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyun.util.FileUtils;
import com.hyun.domain.OrderVO;
import com.hyun.domain.ProductVO;
import com.hyun.dto.Criteria;
import com.hyun.dto.PageDTO;
import com.hyun.service.AdOrderService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/admin/order/*")
@Controller
public class AdOrderController {
	public final AdOrderService adOrderService;
	
	   // 메인 및 썸네일 이미지 업로드 폴더경로 주입작업
	   @Resource(name="uploadPath")	//servlet-context.xml의 bean이름 참조
	   private String uploadPath;

	
	@GetMapping("/order_list")
	public void order_list(Criteria cri, Model model) throws Exception{
		
		   
		   //10 -> 2
		    cri.setAmount(8);
		   
			List<OrderVO> order_list = adOrderService.order_list(cri);
			model.addAttribute("order_list", order_list);
			
			int totalcount = adOrderService.getTotalCount(cri);
			model.addAttribute("pageMaker", new PageDTO(cri, totalcount));
			
	}
	   //상품리스트에서 보여줄이미지, <img src="매핑주소">
	   @ResponseBody
	   @GetMapping("/imageDisplay")
	   public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName)throws Exception {
		   
		   return FileUtils.getFile(uploadPath + dateFolderName, fileName);
	   }
	   

}
