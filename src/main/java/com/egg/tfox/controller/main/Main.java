package com.egg.tfox.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Main {
  
	
	  @GetMapping("/mainView") public String member() {
	  
	 return "mainAdmin/mainView"; }
	
	@GetMapping("/loginMain")
	public String goMain(String error, Model model) {
		if(error != null) {
			model.addAttribute("error","아이디 와 비밀번호를 확인해주세요");
		}
		return "login/loginPage";
	}
	@GetMapping("/accessError")
	public String accessError() {
		return "common/errPage";
	}

	
	

}
