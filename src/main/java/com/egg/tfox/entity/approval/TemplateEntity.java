package com.egg.tfox.entity.approval;

import java.sql.Clob;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TemplateEntity {
	private String temp_id;
	private String temp_title;
	private Clob temp_content;
}
