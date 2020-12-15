package com.egg.tfox.vo.approval;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// 결재 승인 페이지 사용자 정보
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ApprovalDetailEmpVo {
	private String emp_id;
	private String emp_name;
	private String emp_sign;
	
}
