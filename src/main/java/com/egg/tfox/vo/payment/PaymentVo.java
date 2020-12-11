package com.egg.tfox.vo.payment;

import java.sql.Date;

import com.egg.tfox.vo.cart.CartVo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor 
@AllArgsConstructor 
@Builder
public class PaymentVo {
private String pay_id;
private String user_id;
private String pay_type;
private Date pay_time;
private int pay_price;
private String pay_receipt_status;
private String pay_status;
}
