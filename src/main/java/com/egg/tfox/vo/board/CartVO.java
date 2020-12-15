package com.egg.tfox.vo.board;

import com.egg.tfox.entity.Product_file;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartVO {
	
	private String user_id;
	private String pro_id;
	private String pro_name;
	private String pro_size;
	private String pro_color;
	private int pro_ea;
	private int pro_price;

}
