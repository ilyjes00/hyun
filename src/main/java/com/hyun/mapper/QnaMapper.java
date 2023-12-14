package com.hyun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hyun.domain.QnaVO;
import com.hyun.dto.Criteria;

public interface QnaMapper {
	
	void qna_insert(QnaVO vo);
	
	List<QnaVO> qna_list();
	
	List<QnaVO> qna_listWithPaging(Criteria cri);
	
	
	int getTotalCount(Criteria cri);
	
	List<QnaVO> qna_detail(Long qa_num);
	
	void qna_reply(QnaVO vo);

}
