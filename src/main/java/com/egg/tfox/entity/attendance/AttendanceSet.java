package com.egg.tfox.entity.attendance;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AttendanceSet {
	private String attd_id;
	private String attset_day;
	private String attset_start;
	private String attset_end;
	private String corp_id;
	private String attd_category;
	private String attset_yn;
}
