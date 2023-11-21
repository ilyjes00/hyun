package com.hyun.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyun.domain.CartVO;
import com.hyun.domain.MemberVO;
import com.hyun.domain.OrderVO;
import com.hyun.domain.PaymentVO;
import com.hyun.dto.CartDTOList;
import com.hyun.kakaopay.ApproveResponse;
import com.hyun.kakaopay.ReadyResponse;
import com.hyun.service.CartService;
import com.hyun.service.KakaoPayServiceImpl;
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
	private final KakaoPayServiceImpl kakaoPayServiceImpl;
	
	//주문정보페이지
	@GetMapping("/order_info")
	public void order_info(HttpSession session, Model model) throws Exception{
		
		//주문목록
		
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
		List<CartDTOList> order_info = cartService.cart_list(mbsp_id);
		

		
		int order_price = 0;
		
	      for(int i = 0 ; i<order_info.size(); i++) {
	          CartDTOList vo = order_info.get(i);
	          vo.setProd_up_folder(vo.getProd_up_folder().replace("\\", "/"));
	          order_price += (vo.getProd_price() * vo.getCart_amount());
	       }
	
		
		
		model.addAttribute("order_info", order_info);
		model.addAttribute("order_price", order_price);
		
		
		
	}
	//상품상세에서 주문하기
	@GetMapping("/order_ready")
	public String order_ready(CartVO vo, HttpSession session) throws Exception{
		
		log.info("상세주문하기: " + vo);
		
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		vo.setMbsp_id(mbsp_id);
		
		cartService.cart_add(vo);
		
		
		return "redirect:/user/order/order_info";
	}
	
	//카카오 결제 선택을 진행했을경우
	@GetMapping(value = "/orderPay", produces = "application/json")
	public @ResponseBody ReadyResponse payReady(String paymethod ,OrderVO o_vo,  PaymentVO p_vo , int totalprice, HttpSession session) throws Exception{
		
		/*
	      1)	-주문테이블(OrderVO) : odr_status,  payment_status 정보존재 안함.
	      		-주문상세테이블(OrderDetailVO) :
	      			-장바구니 테이블에서 데이터를 참조
	      			-결제테이블 : 보류
	      		
	      		
	      2)	카카오페이에 결제에 필요한 정보구성
	           	스프링에서 처리할수 있는 부분
		*/
		
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		o_vo.setMbsp_id(mbsp_id); //아이디값 할당
		

		
		
		//	시퀀스를 주문번호로 사용: 동일한 주문번호값이 사용되야한다. 중요*
		Long ord_code = (long) orderService.getOrderSeq();
		o_vo.setOrd_code(ord_code); //주문번호저장
		

		//	1) 주문테이블 저장. odr_status,  payment_status 데이터 준비할 것.
			
		log.info("결제방법: " +  paymethod);
		log.info("주문정보: " + o_vo);
		
		p_vo.setOrd_code(ord_code);
		p_vo.setMbsp_id(mbsp_id);
		p_vo.setPay_method("카카오페이");
		p_vo.setPay_tot_price(totalprice);
		
		
		o_vo.setOrd_status("주문완료");
		o_vo.setPayment_status("결제완료");
		
		log.info("결제방법: " + paymethod);
		log.info("주문정보: " + o_vo);
		log.info("결제정보: " +p_vo);
		
		List<CartDTOList> cart_list = cartService.cart_list(mbsp_id);
		
		String itemName = cart_list.get(0).getProd_name() + "외 " + String.valueOf(cart_list.size() - 1) + " 건";

		
		orderService.order_insert(o_vo , p_vo); // 주문,주문상세 정보저장, 장바구니 삭제
		
		
		// 	3)kakao pay 호출
		
		ReadyResponse readyResponse = kakaoPayServiceImpl.payReady(o_vo.getOrd_code(), itemName, cart_list.size(), mbsp_id, totalprice);
		
		log.info("결제고유번호:" + readyResponse.getTid());
		log.info("결제요청URL: " + readyResponse.getNext_redirect_pc_url());
		
		//카카오페이 결제승인요청작업에 필요한 정보준비
		session.setAttribute("tid", readyResponse.getTid());
		session.setAttribute("odr_code", o_vo.getOrd_code());
		
		return readyResponse;
	}
	
	
	// 결제승인요청작업.  http://localhost:9090/user/order/orderApproval
	@GetMapping("/orderApproval") 
	public String orderApproval(@RequestParam("pg_token") String pg_token, HttpSession session) {
		
		
		// 2) Kakao Pay 결제승인요청작업
		Long odr_code = (Long) session.getAttribute("odr_code");
		String tid = (String) session.getAttribute("tid");
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
		ApproveResponse approveResponse  = kakaoPayServiceImpl.payApprove(odr_code, tid, pg_token, mbsp_id);
		
		
		session.removeAttribute("odr_code");
		session.removeAttribute("tid");
		
		return "redirect:/user/order/orderComplete";
	}
	// 결제 완료페이지  http://localhost:9090/user/order/orderComplete
	@GetMapping("/orderComplete") 
	public void orderComplete() {
		
	}
		
	
	//결제취소시 http://localhost:9090/user/order/orderCancle
	@GetMapping("/orderCancle")
	public void orderCancle() {
		
	}
	//결제 실패시 http://localhost:9090/user/order/orderFail
	@GetMapping("/orderFail")
	public void orderFail() {
		
	}
	//무통장입금
	@GetMapping("/nobank")
	public ResponseEntity<String> nobank(String paymethod ,OrderVO o_vo, PaymentVO p_vo, int totalprice, HttpSession session)throws Exception {
		
		ResponseEntity<String> entity = null;
		
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		o_vo.setMbsp_id(mbsp_id); //아이디값 할당
		

		
		
		//	시퀀스를 주문번호로 사용: 동일한 주문번호값이 사용되야한다. 중요*
		Long ord_code = (long) orderService.getOrderSeq();
		o_vo.setOrd_code(ord_code); //주문번호저장
		

		//	1) 주문테이블 저장. odr_status,  payment_status 데이터 준비할 것.
			
		o_vo.setOrd_status("주문완료");
		o_vo.setPayment_status("결제완료");
		
		p_vo.setPay_method("무통장입금");
		p_vo.setOrd_code(ord_code);
		p_vo.setMbsp_id(mbsp_id);
		p_vo.setPay_tot_price(totalprice);
		p_vo.setPay_nobank_price(totalprice);
		
		log.info("결제방법: " + paymethod);
		log.info("주문정보:" + o_vo);
		log.info("결제정보: " + p_vo);
		
		

		
		orderService.order_insert(o_vo, p_vo); // 주문,주문상세 정보저장, 장바구니 삭제
		
		
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		
		return entity;
	}
	

}
