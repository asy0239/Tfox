package com.egg.tfox.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {
		private String pro_id;
		private String pro_name;
		private String st_id;
		private int pro_price;
		private String pro_bigcate;
		private String pro_smallcate;
		private String pro_summary;
		private String pro_detail;
		private int pro_conprice;
		private String pro_size;
		private String pro_color;
		private int pro_ea;
		private String pro_status;
		private int pro_level;
		
		
}
