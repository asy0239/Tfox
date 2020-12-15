package com.egg.tfox.vo;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ProductVo {
	private String pro_name;
	private int pro_price;
	private String pro_summary;
	private String pro_detail;
	private String pro_status;
	private String file_changename;
	
	
}
