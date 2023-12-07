package com.hyun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hyun.domain.MemberVO;
import com.hyun.domain.QnaVO;
import com.hyun.domain.ReviewVO;
import com.hyun.dto.Criteria;
import com.hyun.dto.PageDTO;
import com.hyun.service.QnaService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequiredArgsConstructor
@Log4j
@RequestMapping("user/qna/*")
@Controller
public class QnaController {
	@Autowired
	private final QnaService qnaService;
	
	   //상품리스트	(목록과페이징)
	   @GetMapping("/qna_list")
	   public void qna_list(Model model, @RequestParam(defaultValue = "1") @PathVariable("page")int page) throws Exception {
		   
		   
		   //10 -> 2
			Criteria cri = new Criteria();
			cri.setAmount(2); //페이지수
			cri.setPageNum(page);
			
			List<QnaVO> qna_list = qnaService.qna_list(cri);
			

			model.addAttribute("qna_list", qna_list);
			log.info(qna_list);
			
			
			int totalcount = qnaService.getTotalCount(cri);
			model.addAttribute("pageMaker", new PageDTO(cri, totalcount));
	   
	   }
			
	

	
	//신규 글 작성 화면 요청
	@GetMapping("/qna_insert")
	private void qna_insert() {
		log.info("qna신규 글작성화면요청");
	}
	
	
	
	
	@PostMapping("/qna_insert")
	private String qna_insert(QnaVO vo, Integer qa_num, HttpSession session)throws Exception{
		
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		vo.setMbsp_id(mbsp_id);
		
		//db저장기능
		qnaService.qna_insert(vo);
		
		return "redirect:/user/qna/list";
	}

	//신규 글 저장 처리 요청
	@GetMapping("/qna_detail")
	public void qna_detail(Criteria cri, @ModelAttribute("qa_num") Integer qa_num, Model model)throws Exception{
		
		   log.info("페이징정보 :" + cri);
		   log.info("qna글번호 :" + qa_num);
		QnaVO qnaVO = qnaService.qna_detail(qa_num);
		
		model.addAttribute("QnaVO", qnaVO);
	}
	
	//QNA 글 상세 화면 요청
	
	//QNA 글 삭제 처리 요청
	
	//QNA 글 수정 화면 요청
	
	//QNA 글 수정 처리 요청
	
	//답글 쓰기 화면 요청
	
	//신규 답글 저장 처리 요청

}


