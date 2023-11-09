package com.hyun.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 
 - 주요상요되는 기능
 - 회원가입, 회원수정 폼, 회원 수정하기
 - db회원테이블에서 정보를 읽어올때
 * */

@ToString
@Setter
@Getter
public class MemberVO {

	/*CREATE TABLE mbsp_tbl(
        mbsp_id             VARCHAR2(15),
        mbsp_name           VARCHAR2(30)            NOT NULL,
        mbsp_email          VARCHAR2(50)            NOT NULL,
        mbsp_password       CHAR(60)               NOT NULL,        -- 비밀번호 암호화 처리.
        mbsp_zipcode        CHAR(5)                 NOT NULL,
        mbsp_addr           VARCHAR2(100)            NOT NULL,
        mbsp_deaddr         VARCHAR2(100)            NOT NULL,
        mbsp_phone          VARCHAR2(15)            NOT NULL,
        mbsp_point          NUMBER DEFAULT 0        NOT NULL,
        mbsp_lastlogin      DATE DEFAULT sysdate    NOT NULL,
        mbsp_datesub        DATE DEFAULT sysdate    NOT NULL,
        mbsp_updatedate     DATE DEFAULT sysdate    NOT NULL
);*/
	//멤버필드
	private String mbsp_id;
	private String mbsp_name;
	private String mbsp_email;
	private String mbsp_password;
	private String mbsp_zipcode;
	private String mbsp_addr;
	private String mbsp_deaddr;
	private String mbsp_phone;
	
	private int mbsp_point;
	
	private Date mbsp_lastlogin;
	private Date mbsp_datesub;
	private Date mbsp_updatedate;

	

}
