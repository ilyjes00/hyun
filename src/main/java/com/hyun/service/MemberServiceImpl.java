package com.hyun.service;

import org.springframework.stereotype.Service;

import com.hyun.domain.MemberVO;
import com.hyun.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

	//자동주입
	//@RequiredArgsConstructor : memberMapper 필드를 매개변수로 설정
	private final MemberMapper memberMapper;

	@Override
	public String idcheck(String mbsp_id) {
		// TODO Auto-generated method stub
		return memberMapper.idcheck(mbsp_id);
	}

	@Override
	public void join(MemberVO vo) {
		// TODO Auto-generated method stub
		memberMapper.join(vo);
	}

	@Override
	public MemberVO login(String mbsp_id) {
		// TODO Auto-generated method stub
		return memberMapper.login(mbsp_id);
	}

	@Override
	public void modify(MemberVO vo) {
		// TODO Auto-generated method stub
		memberMapper.modify(vo);
	}

	@Override
	public void loginTimeUpdate(String mbsp_id) {
		
		memberMapper.loginTimeUpdate(mbsp_id);
		
	}

	@Override
	public void delete(String mbsp_id) {
		
		memberMapper.delete(mbsp_id);
		
	}
}
