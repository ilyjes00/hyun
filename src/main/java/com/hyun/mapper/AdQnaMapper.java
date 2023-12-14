package com.hyun.mapper;

import java.util.List;

import com.hyun.domain.QnaVO;
import com.hyun.dto.Criteria;

public interface AdQnaMapper {
	
	List<QnaVO> Adqna_list();
	
	List<QnaVO> Adqna_listWithPaging(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
	List<QnaVO> Adqna_detail(Long qa_num);
	
	void Adqna_reply(QnaVO vo);
	
	void Adqna_modify(QnaVO vo);
	
	void Adqna_delete(Long qa_num);

}
