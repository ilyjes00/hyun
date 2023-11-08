package com.hyun.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hyun.domain.MemberVO;
import com.hyun.dto.LoginDTO;
import com.hyun.dto.memberDTO;
import com.hyun.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

//fianl 필드만 매개변수가 있는 생성자를 만들어주고 스프링에 의하여 생성자 주입을 받게된다.
@RequiredArgsConstructor
@Log4j
@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	// https: //dev-coco.tistory.com/70
	
	private final MemberService memberService;
	
	private final PasswordEncoder passwordEncoder;
	
	@GetMapping("/join")
	public void join() {
		
		log.info("called...join");
	}
	
	// 비동기방식. ajax문법으로 호출
	// 아이디 중복체크
	// ResponseEntity클래스?httpentity를 상속받는, 결과 데이터와 HTTP상태 코드를 직접 제어할수 있는
	// 3가지 구성요소 - HttpStatus, HttpHeaders, HttpBody
	// ajax기능과 함께 사용
	
	@GetMapping("/idcheck")
	public ResponseEntity<String> idcheck(String mbsp_id) {
		
		log.info("아이디: " + mbsp_id);
		
		ResponseEntity<String> entity = null;
		
		
		//서비스 메서드 호출구문작업.
		String idUse = "";
		if(memberService.idcheck(mbsp_id) != null) {
			idUse = "no"; //아이디가 존재하여, 사용불가능
		}else {
			idUse = "yes"; //아이디가 존재하지않아, 사용가능
		}
		
		entity = new ResponseEntity<String>(idUse, HttpStatus.OK);
		
		return entity;
	}

	//회원정보저장 > 다른주소 이동(redirect)
	@PostMapping("/join")
	public String join(MemberVO vo, RedirectAttributes rttr) { //RedirectAttributes rttr은 선택사항이다.
		
		
		log.info("회원정보: " + vo);
		//60byte 암호화작업
		vo.setMbsp_password(passwordEncoder.encode(vo.getMbsp_password()));
		
		log.info("암호화 비밀번호: " + vo.getMbsp_password());
		
		//db저장
		memberService.join(vo);
		return "redirect:/member/login";
	}
	
	//로그인 폼페이지
	@GetMapping("/login")
	public void login() {
		
	}
	//1) 로그인 인증성공 -> 메인페이지(/) 주소이동  2)로그인 인증실패 -> 로그인 폼주소로 이동
	//public String login(String mbsp_id, String mbsp_password)
	//import LoginDTO -> public String login(LoginDTO dto) {
	//1,2번 둘다사용가능
	
	@PostMapping("/login")
	public String login(LoginDTO dto, HttpSession session, RedirectAttributes rttr) {
		
		log.info("로그인: " + dto);
		
		MemberVO db_vo = memberService.login(dto.getMbsp_id());
		
		String url = "";
		String msg = "";
		
		//아이디가 존재하면, true 존재하지않으면 false
		if(db_vo != null) {
			// 사용자가 입력한 비밀번호(평문 텍스트)와 db에서 가져온 암호화된 비밀번호 일치여부 검사
			if(passwordEncoder.matches(dto.getMbsp_password(), db_vo.getMbsp_password())) {
				//로그인 성공결과로 서버측의 메모리를 사용하는 세션형태작업
				session.setAttribute("loginStatus", db_vo);
				
				//로그인 시간 업데이트
				memberService.loginTimeUpdate(dto.getMbsp_id());
				url = "/"; //메인페이지 주소
			}else {
				url = "/member/login"; //로그인 폼주소
				msg = "비밀번호가 일치하지 않습니다.";
				rttr.addFlashAttribute("msg", msg); //로그인 폼 jsp파일에서 사용목적
			}
		}else {
			//아이디가 일치하지않으면
			url = "/member/login"; //로그인 폼주소
			msg = "아이디가 일치하지 않습니다.";
			rttr.addFlashAttribute("msg", msg); //로그인 폼 jsp파일에서 사용
		}
		
		return "redirect:" + url;
	}
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	@GetMapping("/confirmPw")
	public void confirmPw() {
		log.info("회원수정 전 confirm 확인");
	}
	
	
	//회원수정페이지로 이동전 비밀번호 확인
	@PostMapping("/confirmPw")
	public String confirmPW(LoginDTO dto, RedirectAttributes rttr) {
		
		log.info("회원수정전 인증확인: " + dto);
		
		MemberVO db_vo = memberService.login(dto.getMbsp_id());
		
		String url = "";
		String msg = "";
		
		//아이디가 존재하면, true 존재하지않으면 false
		if(db_vo != null) {
			// 사용자가 입력한 비밀번호(평문 텍스트)와 db에서 가져온 암호화된 비밀번호 일치여부 검사
			if(passwordEncoder.matches(dto.getMbsp_password(), db_vo.getMbsp_password())) {
				//로그인 성공결과로 서버측의 메모리를 사용하는 세션형태작업
				url = "/member/modify"; //회원수정폼 주소
			}else {
				url = "/member/confirmPw"; //비밀번호 확인(confirm) 폼주소
				msg = "비밀번호가 일치하지 않습니다.";
				rttr.addFlashAttribute("msg", msg); //로그인 폼 jsp파일에서 사용목적
			}
		}else {
			//아이디가 일치하지않으면
			url = "/member/login"; //로그인 폼주소
			msg = "아이디가 일치하지 않습니다.";
			rttr.addFlashAttribute("msg", msg); //로그인 폼 jsp파일에서 사용
		
	}
		return "redirect:" + url;
}
	
	//회원수정폼 : 인증 사용자의 회원가입 정보를 뷰(view)에 출력.
	@GetMapping("/modify")
	public void modify(HttpSession session, Model model) {
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
		MemberVO db_vo = memberService.login(mbsp_id);
		model.addAttribute("memberVO", db_vo);
	}
	@PostMapping("/modify")
	public String modify(MemberVO vo,HttpSession session, RedirectAttributes rttr) {
		
		log.info("정보수정" + vo);
		
		MemberVO db_vo = (MemberVO) session.getAttribute("loginStatus");
	       
	       String mbsp_id = db_vo.getMbsp_id();
	       
	       vo.setMbsp_id(mbsp_id);
	       
	       memberService.modify(vo);
	       
	       //header.jsp에서 전자우편이 수정된 내용으로 반영이 안되기 때문
	       db_vo.setMbsp_email(vo.getMbsp_email());
	       session.setAttribute("loginStatus", db_vo);
	       
	       rttr.addFlashAttribute("msg","success");
	       
	       return "redirect:/";
	}
	
	//마이페이지
	@GetMapping("/mypage")
	public void mypage(HttpSession session, Model model) throws Exception {
		
		
	}
	//회원탈퇴 폼
	@GetMapping("/delConfirmPw")
	public void delConfirmPw() {
		
	}
	//회원탈퇴
	@PostMapping("/delete")
	public String delete(LoginDTO dto, HttpSession session, RedirectAttributes rttr)throws Exception {
		
		log.info("정보수정" + dto);
		
		MemberVO db_vo = memberService.login(dto.getMbsp_id());
		
		String url = "";
		String msg = "";
		
		//아이디가 존재하면, true 존재하지않으면 false
		if(db_vo != null) {
			// 사용자가 입력한 비밀번호(평문 텍스트)와 db에서 가져온 암호화된 비밀번호 일치여부 검사
			if(passwordEncoder.matches(dto.getMbsp_password(), db_vo.getMbsp_password())) {
				//로그인 성공결과로 서버측의 메모리를 사용하는 세션형태작업
				url = "/"; //회원수정폼 주소
				session.invalidate(); //세션소멸
				
				
				//회원탈퇴.작업할것
				memberService.delete(dto.getMbsp_id());
				
			}else {
				url = "/member/delConfirmPw"; //비밀번호 확인(confirm) 폼주소
				msg = "비밀번호가 일치하지 않습니다.";
				rttr.addFlashAttribute("msg", msg); //로그인 폼 jsp파일에서 사용목적
			}
		}else {
			//아이디가 일치하지않으면
			url = "/member/delConfirmPw"; //로그인 폼주소
			msg = "아이디가 일치하지 않습니다.";
			rttr.addFlashAttribute("msg", msg); //로그인 폼 jsp파일에서 사용
		
	}
		return "redirect:" + url;
	}
	@RequestMapping(value = "/member/search_result_id")
	public String search_result_id(HttpServletRequest request, Model model,
	    @RequestParam(required = true, value = "mbsp_name") String mbsp_name, 
	    @RequestParam(required = true, value = "mbsp_phone") String mbsp_phone,
	    MemberVO searchVO) {
	 
	 
	try {
	    
	    searchVO.setMbsp_name(mbsp_name);
	    searchVO.setMbsp_phone(mbsp_phone);
	    MemberVO memberSearch = memberService.memberIdSearch(searchVO);
	    
	    model.addAttribute("searchVO", memberSearch);
	 
	} catch (Exception e) {
	    System.out.println(e.toString());
	    model.addAttribute("msg", "오류가 발생되었습니다.");
	}
	 
	return "/member/search_result_id";
	}

	 
	@RequestMapping(value = "/member/search_id", method = RequestMethod.GET)
	public String search_id(HttpServletRequest request, Model model,
	        MemberVO searchVO) {
	    
	    
	    return "/member/search_id";
	} 
	
	@RequestMapping(value = "/member/search_pwd", method = RequestMethod.GET)
	public String search_pwd(HttpServletRequest request, Model model,
	        MemberVO searchVO) {
	    
	    
	    return "/member/search_pwd";
	}

	
}
