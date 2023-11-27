package com.hyun.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaVO {
	
	
	/*
	    QA_NUM         NUMBER,
        MBSP_ID         VARCHAR2(15)                NOT NULL,
        PROD_NUM        NUMBER                      NOT NULL,
        QA_CONTENT     VARCHAR2(200)               NOT NULL,
        QA_REGDATE     DATE DEFAULT SYSDATE        NOT NULL,
        ADMIN           VARCHAR2(1)                 default 'N',
        
        qa_num, mbsp_id, prod_num, qa_content, qa_regdate, admin
	  */
	private Long qa_num;
	private String mbsp_id;
	private Integer prod_num;
	private String qa_content;
	private Date qa_regdate;
	private String admin;
	
	

}
