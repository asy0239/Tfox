package com.egg.tfox.controller.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AttendanceController {
	@GetMapping("/attendance/appendance")
	public String appendance() {
		return "/attendance/appendance";
	}
}
