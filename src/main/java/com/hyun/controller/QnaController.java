package com.hyun.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hyun.domain.MemberVO;
import com.hyun.domain.QnaVO;
import com.hyun.domain.ReviewVO;
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
	
	private String qna_list()throws Exception{
		
		return "";
	}


}
