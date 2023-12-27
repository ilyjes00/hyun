package com.hyun.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyun.domain.MemberVO;
import com.hyun.domain.ProductVO;
import com.hyun.domain.QnaVO;
import com.hyun.dto.Criteria;
import com.hyun.dto.PageDTO;
import com.hyun.service.AdMemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequiredArgsConstructor
@Log4j
@RequestMapping("/admin/member/*")
@Controller
public class AdMemberController {
		private final AdMemberService adMemberService;
		
		private final PasswordEncoder passwordEncoder;
		
		@GetMapping("/list")
		public void list(Model model)throws Exception{
			
			
			model.addAttribute("list", adMemberService.list());
			
			log.info(model);
			
		}
		
		///admin/member/modify?mbsp_id=user01
		@GetMapping("/modify")
		private String modify(String mbsp_id, Model model)throws Exception{
			
			model.addAttribute("vo", adMemberService.modify1(mbsp_id));
			
			log.info(model);
			
			return "/admin/member/modify";
		}
		
		@PostMapping("/modify")
		private String modify(MemberVO vo)throws Exception{
			
			log.info("회원정보: " + vo);
			
			vo.setMbsp_password(passwordEncoder.encode(vo.getMbsp_password()));
			
			log.info("암호화 비밀번호: " + vo.getMbsp_password());
			
			adMemberService.modify2(vo);
			
			return "redirect:/admin/member/list";
		}
		
		@GetMapping("/delete")
		private String qna_delete(String mbsp_id)throws Exception {
			
			adMemberService.delete(mbsp_id);
			
			return "redirect:/admin/member/list";
		}
		//엑셀다운로드기능
		@RequestMapping(value = "/list/excelDown.do")
		public void Excel(@ModelAttribute("MemberVO")MemberVO MemberVO, HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception {
			adMemberService.getReserveExcel(MemberVO, request, response);
		}
		
		

}
