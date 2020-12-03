package com.egg.tfox.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.egg.tfox.entity.User;
import com.egg.tfox.service.board.BoardService;

@Controller
public class loginController {
	
	private BoardService service;
	
	
	@GetMapping("/webFront/login")
	public String login() {
		return "webFront/login";
	}
	
	@PostMapping("/login.web")
	public String login(User user, HttpServletRequest req, RedirectAttributes rttr) {
		System.out.println(req.getParameter("user_id"));
		HttpSession session = req.getSession();
//		User login = service.login(user);
//		if(login == null) {
//			session.setAttribute("loginUser", null);
//			rttr.addFlashAttribute("msg", false);
//		}else {
//			session.setAttribute("loginUser", login);
//		}
		
		return "webFront/login";
	}

}
