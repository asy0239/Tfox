package com.egg.tfox.vo.approval;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApprovalEmpPos {
	private String emp_id;
	private String emp_name;
	private String pos_id;
	private String pos_name;
	
}
