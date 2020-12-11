package com.egg.tfox.controller.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.egg.tfox.entity.User;
import com.egg.tfox.service.cart.cartService;
import com.egg.tfox.vo.cart.proVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class Cart {
	@Autowired
	private cartService cartService;

	
	
	@RequestMapping(value="webFront/cart", method=RequestMethod.GET)
	public String proinfo(Model model) {
		List<proVo> proinfo = cartService.proinfo();
		model.addAttribute("proinfo", proinfo);
		System.out.println("상품나오냐 : " + proinfo);
		return "/webFront/cart";
	}
	
	
	
	
	
	
	
	
	
	/*
	 * @RequestMapping(value="userinfo.do", method=RequestMethod.GET) public String
	 * getinfo(Model model) { List<User> getinfo = cartService.getinfo();
	 * model.addAttribute("getinfo", getinfo ); System.out.println("배송지씹 : " +
	 * getinfo); return "redirect:/webFront/cart/userinfo.do"; }
	 */
}
