package com.egg.tfox.vo.board;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class Files {
	private String file_id; //파일코드
	private String file_type; ///파일구분
	private String file_originName; //파일원래이름
	private String file_changeName; //파일바뀐이름
	private String file_route; //파일경로
	private Date file_date; //파일작성일
	private String file_status; //파일상태 (Y)
	private String file_level; //파일레벨(리뷰는0)

}
