package com.egg.tfox.controller.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VacationController {
	@GetMapping("/attendance/vacationRequest")
	public String appendance() {
		return "/attendance/vacationRequest";
	}
	
	@GetMapping("/attendance/test")
	public String test() {
		return "/attendance/test";
	}
	@GetMapping("/attendance/vacationEdit")
	public String vacationEdit() {
		return "/attndance/vacationEdit";
	}
	
	@GetMapping("/attendance/vacationRecong")
	public String vacationRecong() {
		return "/attendance/vacationRecong";
	}
}
