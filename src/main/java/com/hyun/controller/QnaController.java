package com.hyun.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hyun.domain.MemberVO;
import com.hyun.domain.QnaVO;
import com.hyun.domain.ReviewVO;
import com.hyun.dto.CartDTOList;
import com.hyun.dto.Criteria;
import com.hyun.dto.PageDTO;
import com.hyun.mapper.QnaMapper;
import com.hyun.service.QnaService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequiredArgsConstructor
@Log4j
@RequestMapping("user/qna/*")
@Controller
public class QnaController {
	private final QnaService qnaService;
	
	//qna 목록
	@GetMapping("/list")
	private String qna_list(Criteria cri, Model model, HttpSession session)throws Exception{
		
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
	    cri.setAmount(8);
	    
	    List<QnaVO> qna_list = qnaService.qna_list(mbsp_id ,cri);
		model.addAttribute("qna_list", qna_list);
		
		int totalcount = qnaService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalcount));
	    
		
		return "";
	}
	
	//신규 글 작성 화면 요청
	
	//신규 글 저장 처리 요청
	
	//QNA 글 상세 화면 요청
	
	//QNA 글 삭제 처리 요청
	
	//QNA 글 수정 화면 요청
	
	//QNA 글 수정 처리 요청
	
	//답글 쓰기 화면 요청
	
	//신규 답글 저장 처리 요청


}
