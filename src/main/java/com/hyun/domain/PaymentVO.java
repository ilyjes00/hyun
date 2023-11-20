package com.hyun.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PaymentVO {
	
	/*
	  CREATE TABLE PAYMENT (
      PAY_CODE      NUMBER          PRIMARY KEY,    --일련번호
      ORD_CODE      NUMBER          NOT NULL,       --주문번호
      MBSP_ID       VARCHAR2(50)    NOT NULL,       --회원ID
      PAY_METHOD    VARCHAR2(50)    NOT NULL,       --결제방식
      PAY_DATE      DATE            NULL,           --결제일
      PAY_TOT_PRICE NUMBER          NOT NULL,       --결제금액
      PAY_NOBANK_PRICE NUMBER       NOT NULL,       --무통장입금금액
      PAY_REST_PRICE    NUMBER      NOT NULL,       --미지급금
      PAY_NOBANK_USER   VARCHAR2(50)    NULL,       --무통장입금지명
      PAY_NOBANK        VARCHAR2(50)    NULL,       --입금은행
      
      PAY_MEMO          VARCHAR2(100)   NULL        --메모
      );
	 * */
	
	//pay_code, ord_code, mbsp_id, pay_method, pay_date, pay_tot_price, pay_nobank_price, pay_rest_price, pay_nobank_user, pay_nobank, pay_memo
	
	private Integer pay_code;
	private Long 	ord_code;
	private String 	mbsp_id;
	private String	pay_method;
	private Date 	pay_date;
	private Integer pay_tot_price;
	private Integer pay_nobank_price;
	private String 	pay_nobank_user;
	private String 	pay_nobank;
	private String 	pay_memo;
	private String 	pay_bankaccount;

}
