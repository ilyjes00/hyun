package com.hyun.dto;

import lombok.Data;

@Data
public class CartDTOList {

	
	
	private Long cart_code;
	private Integer prod_num;
	private int cart_amount;
	
	private String 	prod_name;
	private int 	prod_price;
	private String 	prod_img;		//스프링에서 별도처리
	private int 	prod_discount;	//스프링에서 별도처리
	private String	prod_up_folder;	
}

