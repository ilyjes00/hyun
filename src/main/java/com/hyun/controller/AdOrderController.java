package com.hyun.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyun.domain.OrderDetailInfoVO;
import com.hyun.domain.OrderDetailProductVO;
import com.hyun.domain.OrderVO;
import com.hyun.dto.Criteria;
import com.hyun.dto.PageDTO;
import com.hyun.service.AdOrderService;
import com.hyun.util.FileUtils;

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
	public void order_list(Criteria cri,@ModelAttribute("start_date") String start_date, @ModelAttribute("end_date")String end_date, Model model) throws Exception{
		
		   
		   //10 -> 2
		    cri.setAmount(8);
		   
			List<OrderVO> order_list = adOrderService.order_list(cri, start_date, end_date);
			model.addAttribute("order_list", order_list);
			
			int totalcount = adOrderService.getTotalCount(cri, start_date, end_date);
			model.addAttribute("pageMaker", new PageDTO(cri, totalcount));
			
	}
	   //상품리스트에서 보여줄이미지, <img src="매핑주소">
	   @ResponseBody
	   @GetMapping("/imageDisplay")
	   public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName)throws Exception {
		   
		   return FileUtils.getFile(uploadPath + dateFolderName, fileName);
	   }
	   
	   
	   
	   
		// 주문상세방법1. 주문상세보기 클라이언트 JSON형태로 변환해서 보내진다. (pom.xml에 jackson-databind 라이브러리 백그라운드로 작동)
		@GetMapping("/order_detail_info1/{ord_code}")
		public ResponseEntity<List<OrderDetailInfoVO>> order_detail_list1(@PathVariable("ord_code") Long ord_code) throws Exception{

			
			
			ResponseEntity<List<OrderDetailInfoVO>> entity = null;
			//클래스명 = 주문상세 + 상품테이블 조인한 결과를 담는 클래스
/*		ResponseEntity<List<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		*/
			List<OrderDetailInfoVO> OrderDetailList = adOrderService.orderDetailInfo1(ord_code);
			
			//날짜폴더의 역슬래시를 슬래시로 바꾸는 작업, 역슬래시로 되어있는 정보가 스프링으로 보내는 요청데이터에 사용되면 에러발생.
			OrderDetailList.forEach(vo -> {
				vo.setProd_up_folder(vo.getProd_up_folder().replace("\\", "/"));
			});
			
			
			entity = new ResponseEntity<List<OrderDetailInfoVO>> (OrderDetailList, HttpStatus.OK);
		
		return entity;
		
		}
		//주문상세내역 개별상품삭제.
			@GetMapping("/order_product_delete")
		   public String order_product_delete(Criteria cri, Long ord_code, Integer prod_num)throws Exception  {
				
				//주문상세 개별삭제
				adOrderService.order_product_delete(ord_code, prod_num);
				
				return "redirect:/admin/order/order_list" + cri.getListLink();
			   
		    }
			//주문상세작업2
			// 주문상세방법1. 주문상세보기 클라이언트 JSON형태로 변환해서 보내진다. (pom.xml에 jackson-databind 라이브러리 백그라운드로 작동)
			@GetMapping("/order_detail_info2/{ord_code}")
			public String order_detail_list2(@PathVariable("ord_code") Long ord_code, Model model) throws Exception{

				List<OrderDetailProductVO> orderProductList = adOrderService.orderDetailInfo2(ord_code);
				
/*				orderProductList.forEach(vo -> {
					vo.setProd_up_folder(vo.getProd_up_folder().replace("\\", "/"));
				});
				*/
				orderProductList.forEach(vo -> {
					vo.getProductVO().setProd_up_folder(vo.getProductVO().getProd_up_folder().replace("\\", "/"));
				});
				
				model.addAttribute("orderProductList", orderProductList);
				
				return "/admin/order/order_detail_pro";
				
				
			}
			
			
			//엑셀다운로드기능
			@RequestMapping(value = "/order_list/excelDown.do")
			public void Excel(@ModelAttribute("OrderVO")OrderVO OrderVO, HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception {
				adOrderService.getReserveExcel(OrderVO, request, response);
			}
			

}
