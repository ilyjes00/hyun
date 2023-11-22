package com.hyun.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private Long rew_num;
	private String mbsp_id;
	private Integer prod_num;
	private String rew_content;
	private int rew_score;
	private Date rew_regdate;
}
