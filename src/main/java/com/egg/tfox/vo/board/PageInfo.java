package com.egg.tfox.vo.board;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PageInfo {
	
	private int currentPage;		//현재 페이지를 표시할 변수
	private int limit;				//한 페이지에 게시글이 몇개가 보여질 것인지
	private int maxPage;			//전체 페이지에서 가장 마지막 페이지
	private int startPage;			//한 번에 표시될 페이지가 시작할 페이지
	private int endPage;			//한 번에 표시될 페이지가 끝나는 페이지
	private int listCount;
}
