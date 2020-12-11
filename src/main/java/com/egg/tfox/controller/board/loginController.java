package com.egg.tfox.controller.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.egg.tfox.service.board.BoardService;
import com.egg.tfox.vo.board.UserVO;

@Controller
public class loginController {
	
	@Autowired
	private BoardService service;
	
	
	@GetMapping("/webFront/login")
	public String login() {
		return "webFront/login";
	}
	
	@PostMapping("/webFront/login.web")
	public String login(
						@RequestParam String user_loginid,
						@RequestParam String user_loginpwd,
						HttpSession session, Model model) {
		System.out.println(user_loginid);
		System.out.println(user_loginpwd);
		
		
		Map<String, Object> loginInfo = new HashMap<>();
		loginInfo.put("userId", user_loginid);
		loginInfo.put("userPwd", user_loginpwd);
		
		
		UserVO login = service.login(loginInfo);
		
		System.out.println(login);
	if(login == null) {
			session.setAttribute("loginUser", null);
			
		}else {
			session.setAttribute("loginUser", login);
			System.out.println(login.getUser_id());
		}
		
		return "webFront/main";
	}
	
	@GetMapping("/webFront/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		return "webFront/main";
	}

}
