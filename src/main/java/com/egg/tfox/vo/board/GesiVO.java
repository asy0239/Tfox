package com.egg.tfox.vo.board;

import java.sql.Date;

import com.egg.tfox.entity.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class GesiVO {
	
	private String gesi_id;
	private String gesi_code;
	private String user_id;
	private String gesi_title;
	private String gesi_content;
	private Date gesi_date;
	private String gesi_status;
	private Date gesi_ansdate;
	private String gesi_anscontent;
	
	
	

}
