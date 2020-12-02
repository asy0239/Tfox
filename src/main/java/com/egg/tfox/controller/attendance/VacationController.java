package com.egg.tfox.controller.attendance;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.egg.tfox.entity.Employee;
import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.service.attendance.VacationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class VacationController {
	
	@Autowired
	private VacationService vacationService;
	
	@GetMapping("/attendance/vacationRequest")
	public String appendance(HttpServletRequest request,Model model) {
		String id =((Employee) request.getSession().getAttribute("loginEmp")).getEMP_ID();
		int vacaday = vacationService.reqday(id);
		
		System.out.println(vacaday);
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
		
		model.addAttribute("vaclist", list);
	
		return "/attendance/vacationRecong";
	}
}
