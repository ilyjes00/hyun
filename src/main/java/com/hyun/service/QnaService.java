package com.hyun.service;

import java.util.List;

import com.hyun.domain.QnaVO;
import com.hyun.dto.Criteria;

public interface QnaService {
	
	void qna_insert(QnaVO vo);
	
	List<QnaVO> qna_list(Integer qa_num, Criteria cri);
	
	int getTotalCount();
	
	QnaVO qna_detail(Integer qa_num);

}
