package com.egg.tfox.entity.attendance;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor @AllArgsConstructor @Data @Builder
public class Calendar {
	private String cal_id;
	private String cal_title;
	private String cal_start;
	
	//테이블엔 없지만 합쳐서 쓸것
	private String cal_time;
}
