package com.hyun.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hyun.domain.QnaVO;
import com.hyun.dto.Criteria;
import com.hyun.mapper.AdQnaMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdQnaServiceImpl implements AdQnaService {
	
	private final AdQnaMapper adQnaMapper;

	@Override
	public List<QnaVO> Adqna_list() {
		// TODO Auto-generated method stub
		return adQnaMapper.Adqna_list();
	}

	@Override
	public List<QnaVO> Adqna_listWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return adQnaMapper.Adqna_listWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return adQnaMapper.getTotalCount(cri);
	}

	@Override
	public List<QnaVO> Adqna_detail(Long qa_num) {
		// TODO Auto-generated method stub
		return adQnaMapper.Adqna_detail(qa_num);
	}

	@Override
	public void Adqna_reply(QnaVO vo) {
		// TODO Auto-generated method stub
		adQnaMapper.Adqna_reply(vo);
	}

	@Override
	public void Adqna_modify(QnaVO vo) {
		// TODO Auto-generated method stub
		adQnaMapper.Adqna_modify(vo);
	}

	@Override
	public void Adqna_delete(Long qa_num) {
		// TODO Auto-generated method stub
		adQnaMapper.Adqna_delete(qa_num);
	}

}
