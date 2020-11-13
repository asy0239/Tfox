package com.egg.tfox.controller.testUser;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestUser {
	@GetMapping("/user")
	public String member() {
		
		return "user/userMain";
	}
}
