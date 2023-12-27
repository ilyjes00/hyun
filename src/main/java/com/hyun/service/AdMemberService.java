package com.hyun.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hyun.domain.MemberVO;
import com.hyun.dto.Criteria;

public interface AdMemberService {
	
	List<MemberVO> list();
	
	int getTotalCount(Criteria cri);
	
	List<MemberVO> modify1(String mbsp_id);
	
	void modify2(MemberVO vo);
	
	void delete(String mbsp_id);

	void getReserveExcel(MemberVO MemberVO,HttpServletRequest request,HttpServletResponse response)throws Exception;
}
