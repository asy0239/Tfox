package com.egg.tfox.vo.approval;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// 로그인한 사람에게 참조된 문서
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApprovalMainRefVo {
	private String send_app_id;
	private String send_emp_id;
	private String send_emp_loginid;
	private String send_emp_name;
	private String send_dept_id;
	private String send_dept_name;
	private String ref_emp_id;
	private String ref_emp_name;
	private String ref_emp_loginid;
	private String app_title;
	private String app_excu_id;
	private String app_date;
	private String app_content;
	private String app_status;
	private String temp_id;
	private String temp_title;
	private String temp_content;
	private String ref_dept_id;
	private String ref_dept_name;
//    send_app_id,
//    send_emp_id,
//    send_emp.emp_loginid send_emp_loginid,
//    send_emp.emp_name send_emp_name,
//    ref_emp_id,
//    ref_emp_name,
//    ref_emp_loginid,
//    app_title,
//    app_excu_id,
//    app_date,
//    app_content,
//    app_status,
//    temp_id,
//    temp_title,
//    temp_content,
//    ref_dept_id,
//    ref_dept_name,
//    dept.dept_id,
//    dept.dept_name
}
