package com.hyun.domain;

import lombok.Data;

// 관리자기능
// 주문상세정보 저장목적. (주문상세테이블과 상품테이블 JOIN 결과)
//OT.ORD_CODE, OT.PROD_NUM, OT.DT_AMOUNT, P.PROD_NUM, P.PROD_NAME, P.PROD_PRICE, P.PROD_UP_FOLDER, P.PROD_IMG

@Data
public class OrderDetailInfoVO {
	
	private Long ord_code;
	private Integer prod_num;
	private String 	prod_name;
	private int 	prod_price;
	private int dt_amount;

	
	private int ord_price; // 주문금액(prod_price * dt_amount)
	
	private String	prod_up_folder;
	private String 	prod_img;
	
		

}
