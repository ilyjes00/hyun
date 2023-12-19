package com.hyun.mapper;


import java.util.List;

import com.hyun.domain.MemberVO;
import com.hyun.dto.Criteria;

public interface AdMemberMapper {
	
	List<MemberVO> list(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
	List<MemberVO> modify1(String mbsp_id);
	
	void modify2(MemberVO vo);

}
