package com.egg.tfox.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.egg.tfox.entity.User;
import com.egg.tfox.service.board.BoardService;

@Controller
public class loginController {
	
	private User service;
	private BoardService boardService;
	@RequestMapping(value="/login.web", method = RequestMethod.POST)
	public String login(User user, HttpServletRequest req, RedirectAttributes rttr) {
		
		HttpSession session = req.getSession();
		User login = boardService.login(user);
		
		
		return "redirect:/";
	}

}
