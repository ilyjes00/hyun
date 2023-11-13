package com.hyun.service;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hyun.domain.MemberVO;

public interface MemberService {
	String idcheck(String mbsp_id);

	void join(MemberVO vo);

	MemberVO login(String mbsp_id);
	
	void modify(MemberVO vo);
	
	void loginTimeUpdate(String mbsp_id);
	
	void delete(String mbsp_id);
	
	MemberVO memberIdSearch(MemberVO searchVO);
	
	MemberVO finduserpwd(String mbsp_id, String mbsp_email);
	
// 확실치 않음
	void updatePwd(String mbsp_id, String mbsp_password);

	
}
