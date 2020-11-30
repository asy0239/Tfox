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
	private String vacapl_ref;
	private String vacapl_reason;
	private String vacapl_status;
}
