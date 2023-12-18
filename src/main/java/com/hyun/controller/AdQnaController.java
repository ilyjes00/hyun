package com.hyun.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hyun.domain.QnaVO;
import com.hyun.dto.Criteria;
import com.hyun.dto.PageDTO;
import com.hyun.service.AdQnaService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequiredArgsConstructor
@Log4j
@RequestMapping("/admin/qna/*")
@Controller
public class AdQnaController {
		private final AdQnaService adQnaService;
		
		//상품리스트	(목록과페이징)
		   @GetMapping("/qna_list")
		   public void qna_list(Criteria cri, Model model ) throws Exception {
			   
			   	cri.setAmount(10);
			   
			   	log.info("list: " + cri);
			   
				
				List<QnaVO> qnalist = adQnaService.Adqna_listWithPaging(cri);
				model.addAttribute("qnalist", qnalist);
				
				log.info(qnalist);
				
				
				
				

				int totalcount = adQnaService.getTotalCount(cri);
				model.addAttribute("pageMaker", new PageDTO(cri, totalcount));
		   
		   }

	
		
		
		//QNA 글 상세 화면 요청 //  http://localhost:9090/admin/qna/qna_detail?qa_num=1
		@GetMapping("/qna_detail")
		public void qna_detail(Long qa_num, Model model) throws Exception{
			
			List<QnaVO> qna_DetailList = adQnaService.Adqna_detail(qa_num);
			
			
			   log.info("qna글번호 :" + qa_num);
			
			model.addAttribute("qna_DetailList", qna_DetailList);
			
			   log.info(qna_DetailList);
			
		}
		
		//답글 쓰기 화면 요청
		@GetMapping("/qna_reply")
		private String qna_reply(Model model , Long qa_num) {
			List<QnaVO> qna_DetailList = adQnaService.Adqna_detail(qa_num);
			
			

			
			model.addAttribute("qna_DetailList", qna_DetailList);
			
			   log.info(qna_DetailList);
			return "admin/qna/qna_reply";
		}
		
		@PostMapping("/qna_reply")
		private String qna_reply(QnaVO vo, HttpSession session)throws Exception{
				
			//db저장기능
			adQnaService.Adqna_reply(vo);
			
			return "redirect:/admin/qna/qna_list";
		}
		
		
		
		@GetMapping("/qna_modify")
		private String qna_modify(Long qa_num, Model model)throws Exception{
			
			model.addAttribute("vo" ,adQnaService.Adqna_detail(qa_num));
			
			return "admin/qna/qna_modify";
		}
		
		@PostMapping("/qna_modify")
		private String qna_modify(QnaVO vo)throws Exception{
			
			adQnaService.Adqna_modify(vo);
			
			return "redirect:/admin/qna/qna_list";
		}
		
		//QNA 글 삭제 처리 요청어드민쪽에서 해결할예정
		@GetMapping("/qna_delete")
		private String qna_delete(Criteria cri, Long qa_num)throws Exception {
			
			adQnaService.Adqna_delete(qa_num);
			
			return "redirect:/admin/qna/qna_list" + cri.getListLink();
		}
		
		//QNA 글 수정 화면 요청 어드민쪽에서 해결할예정
		
		//QNA 글 수정 처리 요청
		

}
