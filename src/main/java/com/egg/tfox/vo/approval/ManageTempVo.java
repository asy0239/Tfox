package com.egg.tfox.vo.approval;

import java.sql.Clob;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ManageTempVo {
	private String temp_id;
	private String temp_title;
	private Clob temp_content;
	private Date temp_date;
	private String emp_id;
	
}
