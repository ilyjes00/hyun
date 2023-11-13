package com.hyun.controller;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hyun.domain.MemberVO;
import com.hyun.dto.memberDTO;
import com.hyun.service.MemberService;
import com.hyun.util.MailUtil;

import lombok.extern.log4j.Log4j;

@Log4j
//@RestController
@Controller
public class UserMailController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/member/finduserpwd")
    public void finduserpwd() {
    	
    }
    
    @PostMapping(value = "/member/finduserpwd")
    public @ResponseBody String findPw(String mbsp_id, String mbsp_email) throws Exception {
    	
    	log.info("아이디: " + mbsp_id);
    	
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        // 회원정보 불러오기
        MemberVO vo1 = memberService.finduserpwd(mbsp_id, mbsp_email);
        System.out.println(vo1);

        // 결과 변수 선언
        String result;

        // 가입된 이메일이 존재한다면 이메일 전송
        if (vo1 != null) {

            // 임시 비밀번호 생성(UUID이용)
            String tempPw = UUID.randomUUID().toString().replace("-", "");// -를 제거
            tempPw = tempPw.substring(0, 10);// tempPw를 앞에서부터 10자리 잘라줌

            vo1.setMbsp_password(tempPw);// 임시 비밀번호 담기

            MailUtil mail = new MailUtil(); // 메일 전송하기
            mail.sendEmail(vo1);

            String securePw = encoder.encode(vo1.getMbsp_password());
//            vo1.setMbsp_password(securePw);

            memberService.updatePwd(mbsp_id, securePw);

            result = "true";

        } else {
            result = "false";
        }
        return result;
    }
}
