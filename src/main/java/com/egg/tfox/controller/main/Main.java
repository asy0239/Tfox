package com.egg.tfox.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Main {
  
	@GetMapping("/member")
	public String member() {
		
		return "mainAdmin/mainView";
	}
	
	
}
