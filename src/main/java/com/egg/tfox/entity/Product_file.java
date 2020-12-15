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
public class Product_file {
	
	
	private String file_id;
	private String file_type;
	private String file_originName;
	private String file_changeName;
	private String file_size;
	
}
