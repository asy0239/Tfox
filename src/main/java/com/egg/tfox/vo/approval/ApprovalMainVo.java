package com.egg.tfox.vo.approval;

import java.sql.Clob;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ApprovalMainVo {
	private String app_id;
	private String emp_id;
	private String app_title;
	private String app_excu_id;
	private Date app_date;
	private Clob app_content;
	private String app_status;
	private Date app_checkTime;
	private String temp_id;
	private String temp_title;
	private Clob temp_content;
	private String emp_name;
	private String dept_id;
	private String dept_name;
}


