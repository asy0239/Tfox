package com.egg.tfox.vo.board;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ProductVO {

	private String pro_id;  		//상품 id
	private String pro_name;		//상품명
	private String st_id;			//재고id
	private int pro_price;			//판매가
	private String bigcate;			//상품대분류
	private String pro_smallcate;	//상품소분류
	private String pro_summary;		//상품 요약설명
	private String pro_detail;		//상품 상세설명
	private int pro_conprice;		//소비자가
	private String pro_size;		//사이즈
	private String pro_color;		//컬러
	private int pro_ea;				//수량
	private String pro_status;		//판매상태		
	private int pro_level;          //상품레벨
  	
}
