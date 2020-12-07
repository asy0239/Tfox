package com.egg.tfox.controller.testUser;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.egg.tfox.entity.User;
import com.egg.tfox.service.user.UserService;


@Controller
public class TestUser {
	@Autowired
	private UserService userservice;
	@GetMapping("/user") 
 
	@RequestMapping(value="/user/userMain", method=RequestMethod.GET) 
	public String userList(Model model) {
		List<User> userlist = userservice.userlist();
		model.addAttribute("userlist", userlist);
		System.out.println("혹시 : " + userlist);
		return "user/userMain";
		
	}
	
	/*
	 * @RequestParam String user_id,
	 * 
	 * @RequestParam String user_name,
	 * 
	 * @RequestParam String user_loginid,
	 * 
	 * @RequestParam Date user_date,
	 * 
	 * @RequestParam String phone,
	 * 
	 * @RequestParam String user_email, Model model) { List<User> userlist =
	 * userservice.userList(); model.addAttribute("userlist", userlist);
	 * System.out.println(userlist);
	 */
	
}
