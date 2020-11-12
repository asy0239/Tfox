package com.egg.tfox.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Board {
	
	@GetMapping("/webFront/main")
	public String main() {
		return "webFront/main";
	}

}
