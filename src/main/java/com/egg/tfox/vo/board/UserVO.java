package com.egg.tfox.vo.board;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class UserVO {
	private String user_id;
	private String user_name;
	private String user_loginid;
	private String user_pwd;
	private String user_phone;
	private Date user_date;
	private String user_addr;
	private String user_number;
	private String user_email;
	private String user_addr2;

}
