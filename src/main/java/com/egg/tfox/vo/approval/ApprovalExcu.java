package com.egg.tfox.vo.approval;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ApprovalExcu {
	private String emp_id;
	private String emp_name;
}
