package com.hyun.service;


import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.hyun.dto.EmailDTO;

import lombok.RequiredArgsConstructor;

// mapper 인터페이스 참조안함.
@RequiredArgsConstructor
@Service
public class EmailServiceImpl implements EmailService {

	//주입	email-config.xml파일의 bean으로 주입
	private final JavaMailSender mailSender;

	@Override
	public void sendMail(EmailDTO dto, String message) {
		// TODO Auto-generated method stub
		//메일 구성정보를 담당하는 객체(받는사람, 보낸느사람 , 받는사람의 메일주소, 본문내용)
		MimeMessage mimeMessage =  mailSender.createMimeMessage();
		
		try {
			//받는사람의 메일주소
			mimeMessage.addRecipient(RecipientType.TO , new InternetAddress(dto.getReceiverMail()));
			//보내는 사람(메일 ,이름)
			mimeMessage.addFrom(new InternetAddress[] {new InternetAddress(dto.getSenderMail(), dto.getSenderName())});;
			//메일제목
			mimeMessage.setSubject(dto.getSubject(), "utf-8");
			//본문내용
			mimeMessage.setText(message,"utf-8");
			
			mailSender.send(mimeMessage);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
