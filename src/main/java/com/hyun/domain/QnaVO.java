package com.hyun.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	
	/*
	 QA_NUM, MBSP_ID, PROD_NUM, QA_CONTENT, QA_TITLE, QA_REGDATE
	 * */
	private Long qa_num;
	private String mbsp_id;
	private Integer prod_num;
	private String qa_content;
	private String qa_title;		
	private Date qa_regdate;
}
