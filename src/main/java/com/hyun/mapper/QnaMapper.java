package com.hyun.mapper;

import java.util.List;

import com.hyun.domain.QnaVO;
import com.hyun.dto.Criteria;

public interface QnaMapper {
	
	void qna_insert(QnaVO vo);
	
	List<QnaVO> qna_list(Criteria cri);
	
	int getTotalCount(Criteria cri);

}
