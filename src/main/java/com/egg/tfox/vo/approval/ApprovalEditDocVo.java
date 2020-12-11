package com.egg.tfox.vo.approval;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// 결재 문서 추가를 위한 VO
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApprovalEditDocVo {
	// app_doc 
	private String app_id;
	private String emp_name; //
	private String emp_id; // 
	private String app_title; // 
	private String app_excu_id; // 
	private Date app_date; 
	private String app_content; //
	private String app_status; // 
	private Date app_checktime; 
	private String temp_name; //
	private String temp_id;
	
	// app_doc_ref
	private List<String> ref_emp_id; // 
	
	// approval_doc
	private List<String> approval_emp_id;//
	private int apporder_code;
	
}
