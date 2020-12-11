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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.egg.tfox.entity.Employee;
import com.egg.tfox.entity.attendance.PagingVO;
import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.entity.attendance.VacationCateSet;
import com.egg.tfox.entity.attendance.VacationRequest;
import com.egg.tfox.entity.attendance.VacationSet;
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
		//사원 id 가지고오기
		String id =((Employee) request.getSession().getAttribute("loginEmp")).getEMP_ID();
		String corpid = ((Employee) request.getSession().getAttribute("loginEmp")).getCORP_ID();
		
		String deptname = vacationService.deptname(id);
		//카테고리 불러오기
		List<String> category = vacationService.vacCategory();
		int vacaday = vacationService.reqday(id);
		
		model.addAttribute("reqDay", vacaday);
		model.addAttribute("deptname", deptname);
		model.addAttribute("category", category);

		return "/attendance/vacationRequest";
	}
	
	@GetMapping("/attendance/vacationMypage")
	public String test(HttpServletRequest request, Model model) {
		String id =((Employee) request.getSession().getAttribute("loginEmp")).getEMP_ID();
		HashMap<String, Object> map = vacationService.vacDayList(id);
		List<String> category = vacationService.vacCategoryAll();
		
		
		List<Vacation> list =vacationService.myVacList(id);
		List<String> cateday = vacationService.vacSearchDay(category, id);
		model.addAttribute("vaclist", list);
		model.addAttribute("Day", map);
		model.addAttribute("category", category);
		model.addAttribute("cateday", cateday);
		return "/attendance/vacationMypage";
	}
	@GetMapping("/attendance/vacationEdit")
	public String vacationEdit(Model model) {
		//온오프 가지고옴 Y N
		List<VacationSet> vac = vacationService.onoff();
		//1~30년 휴가 일수 고르기
		List<VacationSet> vcsday = vacationService.vcsday();
		//휴가 설정 종류 가지고오기
		List<VacationSet> vct = vacationService.vacCate();
		model.addAttribute("onOff", vac);
		model.addAttribute("vcsday", vcsday);
		model.addAttribute("vCate", vct);
		return "/attendance/vacationEdit";
	}
	
	//휴가 승인리스트 보여주는곳
	@GetMapping("/attendance/vacationRecong")
	public String vacationRecong(PagingVO pi,
			@RequestParam (required=false) String search_cate,
			@RequestParam (required=false) String keyword,
			@RequestParam(value="nowPage", required=false)String nowPage, 
			@RequestParam(value="cntPerPage", required=false)String cntPerPage,Model model) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("search_cate", search_cate);
		map.put("keyword", keyword);
		
		
		int total = vacationService.countBoard(map);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		pi = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<Vacation> list = vacationService.selectList(map, pi);
		
		model.addAttribute("vaclist", list);
		model.addAttribute("paging", pi);
	
		return "/attendance/vacationRecong";
	}
	
	//insert구문 휴가 신청
	@PostMapping("/attendance/vacationInsert")
	public String vacationInsert(@ModelAttribute VacationRequest vacRequest) {
		vacationService.vacInsert(vacRequest);
		return "redirect:/attendance/vacationMypage";
	}
	
	@GetMapping("/attendance/vacation/detail")
	public String detail(@RequestParam String vacapl_id , Model model) {
		List<Vacation> list = vacationService.detailList(vacapl_id);
		model.addAttribute("vaclist", list);
		System.out.println(list);
		
		return "/attendance/vacationAccept";
	}
	
	@GetMapping("/attendance/vacation/mydetail")
	public String mydetail(@RequestParam String vacapl_id , Model model) {
		List<Vacation> list = vacationService.detailList(vacapl_id);
		model.addAttribute("vaclist", list);
		System.out.println(list);
		
		return "/attendance/vacationmyAccept";
	}
	@PostMapping("/attendance/vacOnOff")
	public String vacOnOff(@RequestParam String vacOnOff) {
		System.out.println(vacOnOff);
		vacationService.vacOnOffUpdate(vacOnOff);
		
		return "redirect:/attendance/vacationEdit";
	}
	
	@PostMapping("/attendance/vacation/vacationY")
	public String vacationY(@RequestParam String Y, Model model){
		System.out.println(Y);
		vacationService.vacAcceptY(Y);
		return "redirect:/attendance/vacationRecong";
	}
	
	@PostMapping("/attendance/vacation/vacationN")
	public String vacationN(@RequestParam String N, Model model){
		System.out.println(N);
		vacationService.vacAcceptN(N);
		return "redirect:/attendance/vacationRecong";
		
	}
	
	@PostMapping("attendance/vacationDayset")
	public String vacationDayset(@RequestParam List<String> vc_date
			, @RequestParam List<String> year_id ) {
		
		vacationService.vacDaySet(vc_date, year_id);
		return "redirect:/attendance/vacationEdit";
	}
	@PostMapping("attendance/vacCateSet")
	public String vacationCateSet(@RequestParam List<String> vactypeName
			, @RequestParam List<String> vactypeYN
			, @RequestParam List<String> yearYN) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("vactypeName", vactypeName);
		map.put("vactypeYN", vactypeYN);
		map.put("yearYN", yearYN);
		
		vacationService.vacCateSet(vactypeName, vactypeYN, yearYN);
		System.out.println(vactypeName);
		System.out.println(vactypeYN);
		System.out.println(yearYN);
		
		
		return "redirect:/attendance/vacationEdit";
	}
}
