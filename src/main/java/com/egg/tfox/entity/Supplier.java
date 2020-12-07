package com.egg.tfox.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Supplier {
	private String sup_name;
	private int sup_fee;
	private String sup_pur;
	
	
}
