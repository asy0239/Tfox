package com.egg.tfox.controller.userJoin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Join {
	@GetMapping("/join")
	public String member() {
		
		return "webFront/join";
	}
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	@ResponseBody
	public String idCheck() {
		System.out.println("씨발");
		return "넘어간다스프링씨발!";
		
	}
}
