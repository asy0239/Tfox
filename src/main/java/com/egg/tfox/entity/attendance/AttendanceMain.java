package com.egg.tfox.entity.attendance;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @NoArgsConstructor @Builder @Data
public class AttendanceMain {
	private String att_id;
	private String emp_id;
	private String att_start;
	private String att_end;
	private String att_reason;
	private String att_status;
	private String att_date;
}
