package com.egg.tfox.vo.board;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class QnaListVO {

	private int rn;                 //게시물 번호
	private String gesi_id;  		//게시물 ID
	private String gesi_title; 		//제목
	private String gesi_content;	//내용
	private Date gesi_date;			//작성일
	private String gesi_status;		//답변상태
	private Date gesi_ansdate;		//답변일
	private String gesi_anscontent;	//답변내용
	private String user_id;			//유저ID
	private String user_name;		//작성자(유저)
	private String gesi_code;		//게시물 카테고리코드
	private String gesi_name;		//게시물 카테고리 이름
	private String qna_name;		//문의 카테고리 이름

} 
