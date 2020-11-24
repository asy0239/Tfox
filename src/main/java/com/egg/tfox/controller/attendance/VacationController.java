package com.egg.tfox.controller.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VacationController {
	@GetMapping("/appendance/vacationRequest")
	public String appendance() {
		return "/appendance/vacationRequest";
	}
	
	@GetMapping("/appendance/test")
	public String test() {
		return "/appendance/test";
	}
}
