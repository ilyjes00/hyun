package com.hyun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyun.domain.QnaVO;
import com.hyun.dto.Criteria;

public interface QnaMapper {
	
	void qna_insert(QnaVO vo);
	
	List<QnaVO> qna_list();
	
	List<QnaVO> qna_listWithPaging(Criteria cri);
	
	QnaVO get(Long qa_num);
	
	int getTotalCount(Criteria cri);
	
	QnaVO qna_detail(Integer qa_num);

}
