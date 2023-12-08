package com.hyun.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hyun.domain.QnaVO;
import com.hyun.dto.Criteria;
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








	@Override
	public QnaVO qna_detail(Integer qa_num) {
		// TODO Auto-generated method stub
		return qnaMapper.qna_detail(qa_num);
	}






	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return qnaMapper.getTotalCount(cri);
	}








	@Override
	public List<QnaVO> qna_listWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return qnaMapper.qna_listWithPaging(cri);
	}








	@Override
	public List<QnaVO> qna_list() {
		// TODO Auto-generated method stub
		return qnaMapper.qna_list();
	}








	@Override
	public QnaVO get(Long qa_num) {
		// TODO Auto-generated method stub
		return qnaMapper.get(qa_num);
	}
















}
