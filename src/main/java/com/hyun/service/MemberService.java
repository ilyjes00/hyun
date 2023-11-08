package com.hyun.service;

import com.hyun.domain.MemberVO;

public interface MemberService {
	String idcheck(String mbsp_id);

	void join(MemberVO vo);

	MemberVO login(String mbsp_id);
	
	void modify(MemberVO vo);
	
	void loginTimeUpdate(String mbsp_id);
	
	void delete(String mbsp_id);
	
	MemberVO memberIdSearch(MemberVO searchVO);
}
