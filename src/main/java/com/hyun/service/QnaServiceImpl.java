package com.hyun.service;

import org.springframework.stereotype.Service;

import com.hyun.domain.QnaVO;
import com.hyun.mapper.QnaMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class QnaServiceImpl implements QnaService {

	private final QnaMapper qnaMapper;

	@Override
	public void qna_insert(QnaVO vo) {
		// TODO Auto-generated method stub
		qnaMapper.qna_insert(vo);
	}

}
