package com.egg.tfox.entity.attendance;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor @AllArgsConstructor @Data @Builder
public class VacationRequest {
	//휴가 신청 폼 VO
	
	private String emp_id;
	private String dept_name;
	private String vactype_name;
	private Date vacapl_start;
	private Date vacapl_end;
	private String vacapl_reason;
	
	
}
