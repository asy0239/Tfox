package com.egg.tfox.entity;

import java.sql.Blob;
import java.sql.Clob;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Employee {
	private	String EMP_ID;
	private String EMP_NAME;
	private String POS_ID;
	private String EMP_HNUM;
	private String EMP_ADDRESS;
	private String EMP_EMAIL;
	private Date EMP_HIREDATE;
	private Date EMP_LEAVEDATE;
	private String EMP_LOGINID;
	private String EMP_PASSWORD;
	private Blob EMP_SIGN;
	private String DEPT_ID;
	private String CORP_ID;
	private String ENABLED;
	private String AUTH;
	
		
}
