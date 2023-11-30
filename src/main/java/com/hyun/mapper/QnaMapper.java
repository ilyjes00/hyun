package com.hyun.mapper;

import java.util.List;

import com.hyun.domain.QnaVO;
import com.hyun.dto.Criteria;

public interface QnaMapper {
	
	void qna_insert(QnaVO vo);
	
	List<QnaVO> qna_list(Integer qa_num, Criteria cri);
	
	int getTotalCount();
	
	QnaVO qna_detail(Integer qa_num);

}
