package com.hyun.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.hyun.domain.MemberVO;

public interface MemberMapper {
	//jsp에서도 idcheck부분 소문자로 처리해서 이쪽도 소문자처리함
	String idcheck(String mbsp_id);
	
	void join(MemberVO vo);
	
	MemberVO login(String mbsp_id);
	
	void modify(MemberVO vo);
	
	void loginTimeUpdate(String mbsp_id);
	
	void delete(String mbsp_id);
	
	MemberVO memberIdSearch(MemberVO searchVO);

	void setPwdChange(String mbsp_id, String encode);

	MemberVO getPwdSearch(MemberVO pwVO);
	
	MemberVO finduserpwd(@Param("mbsp_id") String mbsp_id, @Param("mbsp_email") String mbsp_email);
	
	void updatePwd(@Param("mbsp_id")  String mbsp_id,@Param("mbsp_password") String mbsp_password);
	
	
	
}
