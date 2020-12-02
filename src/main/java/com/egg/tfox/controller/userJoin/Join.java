package com.egg.tfox.controller.userJoin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.egg.tfox.entity.User;
import com.egg.tfox.service.join.JoinService;

@Controller
public class Join {
	@Autowired
	private SqlSession sqlSession;
	@GetMapping("/join")
	public String join() {
		return "join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute User user) {
		sqlSession.insert("User.add", user);
		return "redirect:insert_finish";
	}
	
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	@ResponseBody
	public String idCheck() {
		System.out.println("쳌");
		return "넘어가라";
		
	}
	/*
	 * @Controller
	 * 
	 * @RequestMapping("/signup/*") public class SingupController {
	 * 
	 * @Inject private SignupService signupService;
	 * 
	 * //SignUp GET
	 * 
	 * @RequestMapping(value="/signup.do", method=RequestMethod.GET) public void
	 * signupGET() {
	 * 
	 * }
	 * 
	 * //SignUp PSOT
	 * 
	 * @RequestMapping(value="/signup.do", method=RequestMethod.POST) public String
	 * signupPOST(SignupVO signVO) {
	 * 
	 * signupService.insertMember(signVO);
	 * 
	 * return "main"; }
	 */
	
}
