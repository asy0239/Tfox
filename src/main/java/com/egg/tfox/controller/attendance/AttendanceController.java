package com.egg.tfox.controller.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AttendanceController {
	@GetMapping("/appendance/appendance")
	public String appendance() {
		return "/appendance/appendance";
	}
}
