package com.hyun.domain;

/*
 CREATE TABLE CATEGORY_TBL(
        CGT_CODE            NUMBER    PRIMARY KEY,    -- 카테고리 코드
        CGT_PARENT_CODE         NUMBER    NULL,           -- 상위카테고리 코드
        CGT_NAME            VARCHAR2(50)    NOT NULL,
        FOREIGN KEY(CGT_PARENT_CODE) REFERENCES CATEGORY_TBL(CGT_CODE)
);
 * */

public class CategoryVO {
	private Integer cgt_code;
	private Integer cgt_parent_code;
	private String cgt_name;
	
	public Integer getCgt_code() {
		return cgt_code;
	}
	public void setCgt_code(Integer cgt_code) {
		this.cgt_code = cgt_code;
	}
	public Integer getCgt_parent_code() {
		return cgt_parent_code;
	}
	public void setCgt_parent_code(Integer cgt_parent_code) {
		this.cgt_parent_code = cgt_parent_code;
	}
	public String getCgt_name() {
		return cgt_name;
	}
	public void setCgt_name(String cgt_name) {
		this.cgt_name = cgt_name;
	}
	@Override
	public String toString() {
		return "CategoryVO [cgt_code=" + cgt_code + ", cgt_parent_code=" + cgt_parent_code + ", cgt_name=" + cgt_name
				+ "]";
	}
	
}
