package com.egg.tfox.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductList {
	
	private String pro_img;
	private String pro_name;
	private int pro_price;
	private String pro_status;
	private String pro_summary;
	private String pro_detail;
	
	
	
	
}
