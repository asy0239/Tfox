package com.egg.tfox.vo.payment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PayRequestResult {
	private String tid;
	private String next_redirect_pc_url;
	private String created_at;
}
