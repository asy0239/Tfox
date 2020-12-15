package com.egg.tfox.controller.testUser;

import java.sql.Date;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//import com.egg.tfox.entity.User;

import com.egg.tfox.service.user.UserService;
import com.egg.tfox.vo.user.PaginInfo;
import com.egg.tfox.vo.user.UserVo;


@Controller
public class TestUser {
	@Autowired
	private UserService userservice;
	@GetMapping("/user") 	
 
	/*@RequestMapping(value="/user/userMain", method=RequestMethod.GET) 
	public String userList(Model model) {
		List<User> userlist = userservice.userlist();
		model.addAttribute("userlist", userlist);
		System.out.println("혹시 : " + userlist);
		return "user/userMain";
		
	}*/
	
	@RequestMapping(value="/user/userMain", method=RequestMethod.GET)
	public String userlist(
	  @RequestParam(value="nowPage", required=false)String nowPage, 
	 @RequestParam(value="cntPerPage", required=false)String cntPerPage, 
	 HttpServletRequest req, Model model, PaginInfo pi
	  ){
		Map<String, Object> maplist = new HashMap<>();
		//maplist.put("user_id", user_id);
		//maplist.put("user_name", user_name);
		//maplist.put("user_loginid", user_loginid);
		//maplist.put("user_date", user_date);
		//maplist.put("phone", phone);
		//maplist.put("user_email", user_email);
		
		int total = userservice.countUser(maplist);
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		
		pi = new PaginInfo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println("?? : " + maplist);
		
		List<UserVo> userlist;
		userlist = userservice.userlist(maplist, pi);
		model.addAttribute("userlist", userlist);
		model.addAttribute("paging", pi);
		
		System.out.println("회원리스트 : " + userlist);
		  return "user/userMain";
	 }
	 
	 
	
}
