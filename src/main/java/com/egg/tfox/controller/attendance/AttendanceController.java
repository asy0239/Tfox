package com.egg.tfox.controller.attendance;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.egg.tfox.entity.Employee;
import com.egg.tfox.entity.attendance.AttendanceEdit;
import com.egg.tfox.entity.attendance.AttendanceMain;
import com.egg.tfox.entity.attendance.AttendanceSet;
import com.egg.tfox.entity.attendance.Calendar;
import com.egg.tfox.service.attendance.AttendanceService;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	@GetMapping("/attendance/attendance")
	public String appendance(HttpServletRequest request, Model model) {
		String id =((Employee) request.getSession().getAttribute("loginEmp")).getEMP_ID();
		List<AttendanceMain> list = attendanceService.worktime(id);
		model.addAttribute("time", list);
		return "/attendance/attendance";
	}
	
	@GetMapping("/attendance/attendanceEdit")
	public String appendanceEdit(Model model) {
		List<AttendanceEdit> edit = attendanceService.attdYNlist();
		List<AttendanceSet> set = attendanceService.attdSetlist();
		model.addAttribute("setlist", set);
		model.addAttribute("atdYN", edit);
		return "/attendance/attendanceEdit";
	}
	
	@PostMapping("/attendance/attStart.do")
	@ResponseBody
	public List<AttendanceMain> goWork(HttpServletRequest request) {
		String id =((Employee) request.getSession().getAttribute("loginEmp")).getEMP_ID();
		attendanceService.workinsertTime(id);
		
		List<AttendanceMain> list = attendanceService.starttime(id);
		return list;
		
	}
	
	@PostMapping("/attendance/attEnd.do")
	@ResponseBody
	public List<AttendanceMain> endWork(@RequestParam String attid, HttpServletRequest request) {
		
		String id =((Employee) request.getSession().getAttribute("loginEmp")).getEMP_ID();
		attendanceService.workendTime(attid, id);
		List<AttendanceMain> list = attendanceService.worktime(id);
		return list;
	}
	
	@PostMapping("/attendance/attCalanview")
	@ResponseBody
	public List<Calendar> attCalanview(HttpServletRequest request) {
		String id =((Employee) request.getSession().getAttribute("loginEmp")).getEMP_ID();
		List<Calendar> list = attendanceService.calenList(id);
		return list;
	}
	
}
