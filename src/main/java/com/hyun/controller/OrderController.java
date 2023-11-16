package com.hyun.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyun.domain.OrderDetailVO;
import com.hyun.domain.OrderVO;
import com.hyun.domain.PaymentVO;
import com.hyun.kakaopay.ReadyResponse;
import com.hyun.domain.MemberVO;
import com.hyun.dto.CartDTOList;
import com.hyun.service.CartService;
import com.hyun.service.OrderService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/user/order/*")
public class OrderController {
	
	private final OrderService orderService;
	private final CartService cartService;
	
	//주문정보페이지
	@GetMapping("/order_info")
	public void order_info(HttpSession session, Model model) throws Exception{
		
		//주문목록
		
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
		List<CartDTOList> order_info = cartService.cart_list(mbsp_id);
		

		
			double order_price = 0;
		
	      for(int i = 0 ; i<order_info.size(); i++) {
	          CartDTOList vo = order_info.get(i);
	          vo.setProd_up_folder(vo.getProd_up_folder().replace("\\", "/"));
	          order_price += ((double)vo.getProd_price() - (vo.getProd_price() * vo.getProd_discount() * 1/100 ))* vo.getCart_amount();
	       }
	
		
		
		model.addAttribute("order_info", order_info);
		model.addAttribute("order_price", order_price);
	}
	
	//카카오 결제 선택을 진행했을경우
	@GetMapping(value = "/orderPay", produces = "application/json")
	public @ResponseBody ReadyResponse payReady(OrderVO O_vo, OrderDetailVO od_vo , PaymentVO p_vo, int totalamount, HttpSession session) throws Exception{
		
		return null;
	}
	
	
	//결제 성공시 http://localhost:9090/user/order/orderApproval
	@GetMapping("/orderApproval")
	public void orderApproval() {
		
	}
	
	//결제취소시 http://localhost:9090/user/order/orderCancle
	@GetMapping("/orderCancle")
	public void orderCancle() {
		
	}
	//결제 실패시 http://localhost:9090/user/order/orderFail
	@GetMapping("/orderFail")
	public void orderFail() {
		
	}
	

}
