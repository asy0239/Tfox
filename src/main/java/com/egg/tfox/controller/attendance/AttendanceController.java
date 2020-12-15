package com.egg.tfox.controller.attendance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		List<AttendanceSet> day = attendanceService.attdWorkTimelist();
		model.addAttribute("time", list);
		model.addAttribute("workday", day);
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
	
	@PostMapping("/attendance/atdOnOff")
	public String atdOnOff(@RequestParam String att_timeYN, @RequestParam String att_52YN) {
		Map<String, Object> map = new HashMap<>();
		map.put("atdyn", att_timeYN);
		map.put("atyn", att_52YN);
		attendanceService.atdOnOff(map);
		return "redirect:/attendance/attendanceEdit";
	}
	
	@PostMapping("/attendance/timedaySet")
	public String timedaySet(@RequestParam List<String> start_time, @RequestParam List<String> endtime,
			@RequestParam String attset_mon, @RequestParam String attset_tue,
			@RequestParam String attset_wed, @RequestParam String attset_thr,
			@RequestParam String attset_fri, @RequestParam String attset_sat,
			@RequestParam String attset_sun) {
		
		List<String> list = new ArrayList<>();
		list.add(attset_mon);
		list.add(attset_tue);
		list.add(attset_wed);
		list.add(attset_thr);
		list.add(attset_fri);
		list.add(attset_sat);
		list.add(attset_sun);
		attendanceService.timedaySet(list, start_time, endtime);
	
		
		return "redirect:/attendance/attendanceEdit";
	}
	
}
