package com.egg.tfox.controller.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AttendanceController {
	@GetMapping("/attendance/attendance")
	public String appendance() {
		return "/attendance/attendance";
	}
	
	@GetMapping("/attendance/attendanceEdit")
	public String appendanceEdit() {
		return "/attendance/attendanceEdit";
	}
	
//	@PostMapping("/attendance/attStart.do")
//	public String 	
	
}
