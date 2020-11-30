package com.egg.tfox.controller.attendance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.service.attendance.VacationService;

@Controller
public class VacationController {
	
	@Autowired
	private VacationService vacationService;
	
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
	public String vacationRecong(Model model) {
		List<Vacation> list = vacationService.selectList();
		return "/attendance/vacationRecong";
	}
}
