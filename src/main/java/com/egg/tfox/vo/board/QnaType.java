package com.egg.tfox.vo.board;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class QnaType {

	private String qna_code;
	private String qna_name;
	
}
