package com.egg.tfox.entity.attendance;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class VacationSet {

//휴가 설정 컬럼임
	// 사용 미사용 구분하는 컬럼 (VacationSet 테이블)
	private String corp_id;
	private String vac_yn;
	private String vac_create;
	private Date vac_date;
	
	// 연차 설정 1년~30년까지 (Year_manage)
	private String year_id;
	private int year_hire;
	private int year_day;
	private String year_standard;
	
	//휴가 종류를 추가하는거 (Vac type)
	private String vactype_id;
	private String vactype_name;
	private String vactype_yn;
	private String vactype_yearyn;


}
