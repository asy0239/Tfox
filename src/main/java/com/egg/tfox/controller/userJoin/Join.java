package com.egg.tfox.controller.userJoin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.egg.tfox.entity.User;
import com.egg.tfox.service.join.JoinService;


@Controller
public class Join {
	@Autowired
	private JoinService joinService; 
	@GetMapping("/webFront/join")
	public String join() {
		return "webFront/join";
	}
	@PostMapping("/userinsert")
	public String insert(@RequestParam String phone1,
			@RequestParam String phone2,
			@RequestParam String phone3,
			@RequestParam String user_pwd1,
			@RequestParam String user_pwd2,
			@RequestParam String user_addr1,
			@RequestParam String user_addr2,
			@RequestParam String user_addr3,
			User user) {
		String phone = phone1+"-"+phone2+"-"+phone3;
		String pwd = user_pwd1;
		String user_addr = user_addr1 + " " + user_addr2 + " " + user_addr3;
		user.setPhone(phone);
		user.setUser_pwd(pwd);
		user.setUser_addr(user_addr);
		System.out.println("form 값 : " + user);
		System.out.println("phone : " + phone);
		joinService.userJoin(user);
		return "webFront/join2";
	}
		
		
	

	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestParam Map<String, Object> param) {
		String inputId = (String) param.get("checkId");
		String checkResult = joinService.checkId(inputId);
		System.out.println("checkResult : " + checkResult);
		return checkResult;
		
	}
	
}
