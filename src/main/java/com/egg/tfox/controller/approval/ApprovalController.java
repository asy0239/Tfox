package com.egg.tfox.controller.approval;

import java.sql.Clob;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.egg.tfox.entity.approval.ApprovalDoc;
import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.service.approval.ApprovalService;
import com.egg.tfox.service.approval.TemplateService;
import com.egg.tfox.vo.approval.ApprovalMainVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ApprovalController {
	
	@Autowired
	private ApprovalService approvalService;
	
	@Autowired
	private TemplateService templateService;
	
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
	public String readTemplate(
			@RequestParam String htmlcontent,
			@RequestParam String doc_type,
			HttpServletRequest request,
			Model model) {
		String template = htmlcontent;
		String docType = doc_type;
		System.out.println("request :" + request.getParameter("htmlcontent"));
//		System.out.println(template);
		System.out.println("requset :" + request.getParameter("doc_title"));
		System.out.println("requset :" + request.getParameter("doc"));
		model.addAttribute("template", template);
		model.addAttribute("docType", docType);
		return "/approval/readTemplate";
	}
	
	// 전자결재 메인 페이지로 이동 
	@GetMapping("/approval/approval_Main")
	public String approvalMain(Model model) {
		
		// 메인 페이지에 표시할 여러 값들 가져오기
		List<ApprovalMainVo> list = approvalService.selectDocList();
		int overWeekDayCount = approvalService.overWeekDay();
		int noCheckDocCount = approvalService.noCheckDoc();
		int allDocCount = approvalService.allDoc();
		List<TemplateEntity> templateList = templateService.listAll(); 
		model.addAttribute("docList",list);
		model.addAttribute("overWeekDayCount" , overWeekDayCount);
		model.addAttribute("noCheck", noCheckDocCount);
		model.addAttribute("allDocCount", allDocCount);
		model.addAttribute("templateList", templateList);
		
		return "/approval/approval_Main";
	}
	
	@GetMapping("/approval/approval_send")
	public String approvalSend() {
		return "/approval/approval_send";
	}
	
	@GetMapping("/approval/approval_get")
	public String approvalGet() {
		return "/approval/approval_get";
	}
	
	@GetMapping("/approval/approval_get_detail")
	public String approvalGetDetail() {
		return "/approval/approval_get_detail";
	}
	
	@GetMapping("/approval/approval_temporary")
	public String approvalTemporary() {
		return "/approval/approval_temporary";
	}
	
	@GetMapping("/approval/approval_reference")
	public String approvalReference() {
		return "/approval/approval_reference";
	}
	
	@GetMapping("/approval/approval_manage")
	public String approvalManage(Model model) {
		List<TemplateEntity> templateList = templateService.listAll();
		model.addAttribute("templateList", templateList);
		return "/approval/approval_manage";
	}
	
	@GetMapping("/approval/approval_edit_template")
	public String approvalEditTemplate() {
		return "/approval/approval_edit_template";
	}
	
	@PostMapping("/approval/editTemplate")
	public String approvalEditTemplate(HttpServletRequest request) {
		String content = request.getParameter("htmlcontent");
		String title = request.getParameter("temp_title");
		templateService.insertTemplate(content, title);
		return "/approval/approval_manage";
		
	}
}
