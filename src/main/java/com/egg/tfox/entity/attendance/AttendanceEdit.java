package com.egg.tfox.entity.attendance;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class AttendanceEdit {
	private String attdb_id;
	private String attdb_yn;
	private String attdb_oe;
	private String corp_id;
}
