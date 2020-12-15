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
public class PayAmount {
	private int total;
	private int tax_free;
	private int vat;
	private int point;
	private int discount;
}
