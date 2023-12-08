package com.hyun.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hyun.domain.MemberVO;
import com.hyun.domain.QnaVO;
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
	private final QnaService qnaService;
	
	   //상품리스트	(목록과페이징)
	   @GetMapping("/qna_list")
	   public void qna_list(Criteria cri, Model model ) throws Exception {
		   
		   	cri.setAmount(2);
		   
		   	log.info("list: " + cri);
			
			List<QnaVO> qnalist = qnaService.qna_listWithPaging(cri);
			model.addAttribute("qnalist", qnalist);
			
			
			
			

			int totalcount = qnaService.getTotalCount(cri);
			model.addAttribute("pageMaker", new PageDTO(cri, totalcount));
	   
	   }
	   @GetMapping("/get")
	   public void get(Long qa_num, @ModelAttribute("cri") Criteria cri, Model model) {
		   log.info("게시물번호: " + qa_num);
		   
		   
		   QnaVO board = qnaService.get(qa_num);
		   model.addAttribute("board", board);
	   }
			
	

	
	//신규 글 작성 화면 요청
	@GetMapping("/qna_insert")
	private void qna_insert() {
		log.info("qna신규 글작성화면요청");
	}
	
	
	
	
	@PostMapping("/qna_insert")
	private String qna_insert(QnaVO vo, HttpSession session, RedirectAttributes rttr)throws Exception{
			
		//db저장기능
		qnaService.qna_insert(vo);
		
		rttr.addFlashAttribute("msg", "qna_insert");
		
		return "redirect:/user/qna/qna_list";
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


