package com.egg.tfox.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Board {
	
	@GetMapping("/webFront/header")
	public String header() {
		return "webFront/header";
	}
	
	@GetMapping("/webFront/main")
	public String main() {
		return "webFront/main";
	}
	
	@GetMapping("/webFront/login")
	public String login() {
		return "webFront/login";
	}

}
