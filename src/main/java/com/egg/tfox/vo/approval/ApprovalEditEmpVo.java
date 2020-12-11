package com.egg.tfox.vo.approval;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// 조직도를 위한 vo
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ApprovalEditEmpVo {
	private String emp_id;
	private String emp_name;
	private String dept_id;
	private String dept_name;
	private String pos_id; // 
	private String pos_name; //	
}
