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

	@GetMapping("/webFront/slide")
	public String slide() {
		return "webFront/slide";
	}
	
	@GetMapping("/webFront/center")
	public String center() {
		return "webFront/center";
	}
	@GetMapping("/webFront/hood-item")
	public String hoodItem(){
		return "webFront/hood-item";
	}
	@GetMapping("/board/gesipan")
	public String gesipan(){
		return "board/gesipan";
	}
	@GetMapping("/board/gesimul")
	public String gesimul(){
		return "board/gesimul";
	}
	
}
