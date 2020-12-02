package com.egg.tfox.controller.approval;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.egg.tfox.entity.Employee;
import com.egg.tfox.entity.approval.ApprovalDoc;
import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.service.approval.ApprovalService;
import com.egg.tfox.service.approval.TemplateService;
import com.egg.tfox.vo.approval.ApprovalMainNoCheckVo;
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
		System.out.println("request :"+ request.getParameter("htmlcontent"));
//		System.out.println(template);
		model.addAttribute("template", template);
		model.addAttribute("docType", docType);
		return "/approval/readTemplate";
	}
	
	// 전자결재 메인 페이지로 이동 
	@GetMapping("/approval/approval_Main")
	public String approvalMain(Model model) {
		// 현재 로그인한 유저정보 조회
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userName = authentication.getName();	
		// 현재 로그인한 유저 결재(상신) 문서 전체 내역
		List<ApprovalMainVo> list = approvalService.selectDocList(userName);		
		// 현재 로그인한 유저의 양식 리스트(순위)
		List<HashMap<String, String>> userTemplateList = approvalService.templateList(userName);
		// 결재 양식 정보
		List<TemplateEntity> templateList = templateService.listAll();	
		// 7일간 결재가 이루어지지 않은 내역
		List<ApprovalMainVo> weekIgnore = approvalService.weekIgnore(userName);
		// 결재 처리를 안한 내역
		List<ApprovalMainNoCheckVo> noCheck = approvalService.noCheck(userName);
		model.addAttribute("docList",list);
		model.addAttribute("userTemplateList", userTemplateList);
		model.addAttribute("templateList", templateList);
		model.addAttribute("weekIgnore",weekIgnore);
		model.addAttribute("noCheck", noCheck);
		
		return "/approval/approval_Main";
	}
	
	@RequestMapping(value="/approval/weekIgnore.do" , method = RequestMethod.GET)
	@ResponseBody
	public List<ApprovalMainVo> approvalMainWeekIgnore(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userName = authentication.getName();
		List<ApprovalMainVo> list = approvalService.weekIgnore(userName);
		return list;
	}
	
	@RequestMapping(value="/approval/noCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public List<ApprovalMainNoCheckVo> approvalMainNoCheck(Model model){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userName = authentication.getName();
		
		List<ApprovalMainNoCheckVo> list = approvalService.noCheck(userName);
		log.info("list : " + list);
		return list;
	}
	
	@RequestMapping(value="/approval/totalDoc.do")
	@ResponseBody
	public HashMap<String, Object> approvalMainTotal(Model model){
		return null;
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
	public String approvalManage() {
		return "/approval/approval_manage";
	}
	
	@GetMapping("/approval/approval_edit_template")
	public String approvalEditTemplate() {
		return "/approval/approval_edit_template";
	}
}
