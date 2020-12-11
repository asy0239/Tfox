package com.egg.tfox.vo.cart;

import java.sql.Date;

import com.egg.tfox.vo.user.UserVo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor 
@AllArgsConstructor 
@Builder 
public class CartVo {
	 private String pro_id; //상품id
	 private String pro_name; //상품명
	 private String st_id; //재고id
	 private int pro_price; //판매가
	 private String pro_bigcate; //상품대분류
	 private String pro_smallcate; //상품소분류
	 private String pro_summary; //상품 요약설명
	 private String pro_detail; //상품 상세설명
	 private int pro_conprice; //소비자가
	 private String pro_size; //사이즈
	 private String pro_color; //컬러
	 private int pro_ea; //수량
	 private String pro_status; //판매상태
	 private String pay_id;
	 private int order_ea;
	 private Date order_date;
	 private String order_num;
	 private String order_state;
	 private String total_price;
	 private String user_id;
	 private String user_name;
	 private String user_loginid;
	 private String user_pwd;
	 private String user_phone;
	 private Date user_date;
	 private String user_addr;
	 private String user_number;
	 private String user_email;
	 private String pay_type;
	 private Date pay_time;
	 private int pay_price;
	 private String pay_receipt_status;
	 private String pay_status;
	
}
