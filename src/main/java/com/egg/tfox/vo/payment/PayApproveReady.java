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
public class PayApproveReady {
	private String tid; 
	private String partner_order_id, partner_user_id; 
	private String pg_token;
}
