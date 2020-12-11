package com.egg.tfox.vo.approval;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApprovalEmpPos /* implements Comparable<ApprovalEmpPos> */{
	private String emp_id;
	private String emp_name;
	private String pos_id;
	private String pos_name;
	
	/*
	 * @Override public int compareTo(ApprovalEmpPos o) { int compareResult =
	 * this.pos_id.compareTo(o.pos_id); if(compareResult < 0) { return -1; } else
	 * if(compareResult > 0) { return 1; } return 0; }
	 */
	
}
