package com.egg.tfox.controller.approval;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.egg.tfox.entity.Employee;
import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.service.approval.ApprovalEditService;
import com.egg.tfox.service.approval.ApprovalService;
import com.egg.tfox.service.approval.TemplateService;
import com.egg.tfox.vo.approval.ApprovalEditDocVo;
import com.egg.tfox.vo.approval.ApprovalEditEmpVo;
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
	
	@Autowired
	private ApprovalEditService approvalEditService;
	// 새 결재 문서 작성 페이지로 이동
	@GetMapping("/approval/approval_edit")
	public String appWrite(HttpServletRequest request , Model model) {
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("loginEmp");		
		String searchEmpList = approvalEditService.searchEmpList(emp.getEMP_ID());
		List<TemplateEntity> tempList = templateService.listAll();
		model.addAttribute("empList",searchEmpList);
		model.addAttribute("tempList", tempList);
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
			HttpServletRequest request,
			Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userName = authentication.getName();	
		String app_title = request.getParameter("inputTitle");
		String app_content = request.getParameter("htmlcontent");
		String temp_name = request.getParameter("tempName");
		String soosin_empId = request.getParameter("soosin_empId");
		String player_empId = request.getParameter("player_empId");
		String final_empId = request.getParameter("final_empId");
		
		String[] ref_split = soosin_empId.split(",");
		List<String> refEmpList = new ArrayList<String>();
		for(int i = 0; i < ref_split.length; i++) {
			refEmpList.add(ref_split[i].trim());
		} // 여기 손봐라
		String[] final_split = final_empId.split(",");
		List<String> approvalEmpList = new ArrayList<String>();
		for(int i = 0; i < final_split.length; i++) {
			approvalEmpList.add(final_split[i].trim());
		}
		
		log.info("tempName : " + temp_name);
		ApprovalEditDocVo appDoc = ApprovalEditDocVo.builder()
		// app_doc
		.app_title(app_title)
		.emp_name(userName)
		.app_excu_id(player_empId)
		.app_content(app_content)
		.app_status("전송")
		.temp_name(temp_name)
		// app_ref
		.ref_emp_id(refEmpList)
		// app_stats
		.approval_emp_id(approvalEmpList).build();
		
		approvalEditService.insertAppDoc(appDoc);
		
		
		return "redirect:/approval/approval_Main";
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
		// 사용자와 관려된 모든 내역
		HashMap<String, Object> totalList = approvalService.totalDoc(userName);
		model.addAttribute("docList",list);
		model.addAttribute("userTemplateList", userTemplateList);
		model.addAttribute("templateList", templateList);
		model.addAttribute("weekIgnore",weekIgnore);
		model.addAttribute("noCheck", noCheck);
		model.addAttribute("totalDoc", totalList);
		
		
		return "/approval/approval_Main";
	}

	
	
	@RequestMapping(value="/approval/weekIgnore.do" , method = RequestMethod.POST)
	@ResponseBody
	public List<ApprovalMainVo> approvalMainWeekIgnore(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userName = authentication.getName();
		List<ApprovalMainVo> list = approvalService.weekIgnore(userName);
		return list;
	}
	
	@RequestMapping(value="/approval/noCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public List<ApprovalMainNoCheckVo> approvalMainNoCheck(Model model){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userName = authentication.getName();
		
		List<ApprovalMainNoCheckVo> list = approvalService.noCheck(userName);
		return list;
	}
	
	@RequestMapping(value="/approval/totalDoc.do" , method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> approvalMainTotal(Model model){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userName = authentication.getName();
		HashMap<String, Object> list = approvalService.totalDoc(userName);
		return list;
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
