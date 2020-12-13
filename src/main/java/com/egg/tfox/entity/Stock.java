package com.egg.tfox.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Stock {
	private String st_id;
	private int st_price;
	private String st_company;
	private String st_factory;
	private Date st_date;
	private String st_orign;
	
	
	
}
