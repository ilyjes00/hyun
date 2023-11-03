package com.hyun.domain;

import java.util.Date;

import lombok.Data;

/*
 CREATE TABLE PRODUCT_TBL(
        PROD_NUM             NUMBER  CONSTRAINT  PK_PROD_NUM         PRIMARY KEY,
        CGT_CODE            NUMBER            NULL,
        PROD_NAME            VARCHAR2(50)            NOT NULL,
        PROD_PRICE           NUMBER                  NOT NULL,
        PROD_DISCOUNT        NUMBER                  NOT NULL,
        PROD_PUBLISHER       VARCHAR2(50)            NOT NULL,
        PROD_CONTENT         VARCHAR2(4000)                 NOT NULL,       -- 내용이 4000BYTE 초과여부판단?
        PROD_UP_FOLDER       VARCHAR(50)             NOT NULL,
        PROD_IMG             VARCHAR(50)             NOT NULL,  -- 날짜폴더경로가 포함하여 파일이름저장
        PROD_AMOUNT          NUMBER                  NOT NULL,
        PROD_BUY             CHAR(1)                 NOT NULL,
        PROD_DATE            DATE DEFAULT SYSDATE    NOT NULL,
        PROD_UPDATEDATE      DATE DEFAULT SYSDATE    NOT NULL,
        FOREIGN KEY(CGT_CODE) REFERENCES CATEGORY_TBL(CGT_CODE)
);
 * */

@Data
public class ProductVO {
	
	private Integer prod_num;
	private Integer cgt_code;
	private String 	prod_name;
	private int 	prod_price;
	private int 	prod_discount;
	private String 	prod_publisher;
	private String 	prod_content;
	private String	prod_up_folder;
	private String 	prod_img;
	private int 	prod_amount;
	private String 	prod_buy;
	private Date 	prod_date;
	private Date 	prod_updatedate;
	
}
