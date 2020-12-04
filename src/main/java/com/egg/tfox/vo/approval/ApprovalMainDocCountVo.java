package com.egg.tfox.vo.approval;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
// 자신이 보낸 문서 내역 갯수
public class ApprovalMainDocCountVo {
	private String tmp_id;
	private String count;
}
