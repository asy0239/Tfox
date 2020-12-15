package com.egg.tfox.vo.payment;

import java.sql.Date;

import com.egg.tfox.entity.Payment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor 
@AllArgsConstructor 
@Builder 
public class PayApproveResult {
	private String aid, tid, cid, sid;
	private String partner_order_id, partner_user_id;
	private String payment_method_type;
	
	private PayAmount amount;
	private PayCardInfo card_info;
	
	private String item_name, item_code;
	private int quantity;
	private Date created_at;
	private Date approved_at;
	private String payload;
}
