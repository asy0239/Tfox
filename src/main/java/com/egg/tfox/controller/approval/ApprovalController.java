package com.egg.tfox.controller.approval;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ApprovalController {
	
	// 새 결재 문서 작성 페이지로 이동
	@GetMapping("/approval/approval_edit")
	public String appWrite() {
		return "/approval/approval_edit";
	}
	
	// 테스트용
	@GetMapping("/approval/test")
	public String appWriteSample() {
		return "/approval/test";
	}

	// 입력한 결재 문서 확인 페이지, test임
	@PostMapping("/approval/readTemplate")
	public String readTemplate(@RequestParam String htmlcontent, HttpServletRequest request, Model model) {
		String template = htmlcontent;
		System.out.println("request :"+ request.getParameter("htmlcontent"));
//		System.out.println(template);
		model.addAttribute("template", template);
		return "/approval/readTemplate";
	}
	
	// 전자결재 메인 페이지로 이동 
	@GetMapping("/approval/approval_Main")
	public String approvalMain() {
		return "/approval/approval_Main";
	}
}
