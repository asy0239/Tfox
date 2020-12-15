package com.egg.tfox.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor 
@AllArgsConstructor 
@Builder 
public class Payment {

private int no;
private String pay_id;
private String user_id;
private String pro_id;
private String tid;
private String partner_order_id, partner_user_id;
private int total_amount;
private String item_name;
private int quantity;
private Date time;
private String pay_status;
private String pay_type;


}
