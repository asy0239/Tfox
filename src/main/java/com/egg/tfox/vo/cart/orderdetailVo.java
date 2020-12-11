package com.egg.tfox.vo.cart;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class orderdetailVo {
	private String pay_id;
	private String pro_id;
	private int order_ea;
	private Date order_date;
	private String order_num;
	private String order_state;
	private String total_price;

}
