package com.egg.tfox.entity.attendance;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor @AllArgsConstructor @Data @Builder
public class VacationMy {
	private String emp_id;
	private String vactype_name;
}
