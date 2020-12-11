package com.egg.tfox.controller.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.egg.tfox.entity.User;
import com.egg.tfox.service.cart.cartService;
import com.egg.tfox.vo.cart.CartVo;
import com.egg.tfox.vo.cart.orderdetailVo;
import com.egg.tfox.vo.cart.proVo;
import com.egg.tfox.vo.board.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class Cart {
	@Autowired
	private cartService cartService;

	
	/*
	 * @RequestMapping(value="webFront/cart", method=RequestMethod.GET) public
	 * String proinfo(Model model) { List<proVo> proinfo = cartService.proinfo();
	 * model.addAttribute("proinfo", proinfo); System.out.println("상품나오냐 : " +
	 * proinfo); return "/webFront/cart"; }
	 */
	
	@GetMapping("/webFront/cart")
	public String cart(Model model, HttpSession session) {
		System.out.println("ss" + session.getAttribute("loginUser"));	
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		String userId = user.getUser_loginid();
		System.out.println("제발 1 : " + userId);
		List<User> getInfo = cartService.getInfo(userId);		
		List<proVo> proInfo = cartService.proInfo(userId);		
		List<orderdetailVo> orderInfo = cartService.orderInfo(userId);		
		model.addAttribute("getInfo", getInfo);	
		model.addAttribute("proInfo", proInfo);	
		model.addAttribute("orderInfo", orderInfo);	
		model.addAttribute("user", getInfo);	
		System.out.println("getInfo : " + getInfo);
		System.out.println("proInfo : " + proInfo);
		System.out.println("orderInfo : " + orderInfo);
		return "webFront/cart";
	}
	
	
	
	
	
	
	
	
	
	/*
	 * @RequestMapping(value="userinfo.do", method=RequestMethod.GET) public String
	 * getinfo(Model model) { List<User> getinfo = cartService.getinfo();
	 * model.addAttribute("getinfo", getinfo ); System.out.println("배송지씹 : " +
	 * getinfo); return "redirect:/webFront/cart/userinfo.do"; }
	 */
}
