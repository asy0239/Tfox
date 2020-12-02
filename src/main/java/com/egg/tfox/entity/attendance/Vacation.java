package com.egg.tfox.entity.attendance;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class Vacation {
	private String vacapl_id;
	private String vactype_id;
	private String emp_id;
	private Date vacapl_start;
	private Date vacapl_end;
	private Date vacapl_appdate;
	private String vacapl_reason;
	private String vacapl_status;
	
	//휴가 종류 이름 가지고오기
	private String vactype_name;
	
	//Employee 테이블거 이름 가지고와야함
	private String emp_name;
	
	//부서명 가지고오기
	private String dept_name;
}
