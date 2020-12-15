package com.egg.tfox.vo.payment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PayRequestReady {

	private String partner_order_id;
	private String partner_user_id;
	private String item_name;
	private int total_amount;
	private int quantity;
	private String pay_id;
}
