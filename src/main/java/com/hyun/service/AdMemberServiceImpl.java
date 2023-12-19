package com.hyun.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hyun.domain.MemberVO;
import com.hyun.dto.Criteria;
import com.hyun.mapper.AdMemberMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdMemberServiceImpl implements AdMemberService {
	
	private final AdMemberMapper adMemberMapper;

	@Override
	public List<MemberVO> list(Criteria cri) {
		// TODO Auto-generated method stub
		return adMemberMapper.list(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return adMemberMapper.getTotalCount(cri);
	}

	@Override
	public List<MemberVO> modify1(String mbsp_id) {
		// TODO Auto-generated method stub
		return adMemberMapper.modify1(mbsp_id);
	}

	@Override
	public void modify2(MemberVO vo) {
		// TODO Auto-generated method stub
		adMemberMapper.modify2(vo);
	}

}
