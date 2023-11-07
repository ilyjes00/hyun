package com.hyun.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class ProductDTO {
	
	private Integer prod_num;
	private int 	prod_price;
	private String 	prod_buy;
}
