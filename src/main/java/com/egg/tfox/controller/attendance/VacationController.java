package com.egg.tfox.controller.attendance;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.egg.tfox.entity.Employee;
import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.entity.attendance.VacationRequest;
import com.egg.tfox.service.attendance.VacationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class VacationController {
	
	@Autowired
	private VacationService vacationService;
	
	//휴가신청페이지
	@GetMapping("/attendance/vacationRequest")
	public String appendance(HttpServletRequest request,Model model) {
		String id =((Employee) request.getSession().getAttribute("loginEmp")).getEMP_ID();
		String corpid = ((Employee) request.getSession().getAttribute("loginEmp")).getCORP_ID();
		
		String deptname = vacationService.deptname(id);
		List<String> category = vacationService.vacCategory();
		int vacaday = vacationService.reqday(id);
		
		model.addAttribute("reqDay", vacaday);
		model.addAttribute("deptname", deptname);
		model.addAttribute("category", category);

		return "/attendance/vacationRequest";
	}
	
	@GetMapping("/attendance/vacationMypage")
	public String test() {
		return "/attendance/vacationMypage";
	}
	@GetMapping("/attendance/vacationEdit")
	public String vacationEdit() {
		return "/attendance/vacationEdit";
	}
	
	//휴가 승인리스트 보여주는곳
	@GetMapping("/attendance/vacationRecong")
	public String vacationRecong(Model model) {
		List<Vacation> list = vacationService.selectList();
		
		model.addAttribute("vaclist", list);
	
		return "/attendance/vacationRecong";
	}
	
	//insert구문
	@PostMapping("/attendance/vacationInsert")
	public String vacationInsert(@ModelAttribute VacationRequest vacRequest) {
		vacationService.vacInsert(vacRequest);
		return "redirect:/attendance/vacationRecong";
	}
}
