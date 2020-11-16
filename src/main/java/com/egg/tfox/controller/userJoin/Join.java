package com.egg.tfox.controller.userJoin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Join {
	@GetMapping("/join")
	public String member() {
		
		return "webFront/join";
	}
}
