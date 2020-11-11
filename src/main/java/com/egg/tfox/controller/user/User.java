package com.egg.tfox.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class User {
  
	@GetMapping("/member")
	public String member() {
		
		return "mainAdmin/mainView";
	}
	
	
}
