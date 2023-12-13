package com.hyun.service;

import java.util.List;

import com.hyun.domain.QnaVO;
import com.hyun.dto.Criteria;

public interface QnaService {
	
	void qna_insert(QnaVO vo);
	
	List<QnaVO> qna_list();
	
	List<QnaVO> qna_listWithPaging(Criteria cri);
	
	QnaVO get(Long qa_num);
	
	int getTotalCount(Criteria cri);
	
	List<QnaVO> qna_detail(Long qa_num);
	
	void qna_reply(QnaVO vo);
	
	

}
