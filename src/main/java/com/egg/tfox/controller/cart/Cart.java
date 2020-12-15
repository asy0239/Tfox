package com.egg.tfox.controller.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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

	
	@RequestMapping("webFront/cart")
	public String list(HttpSession session, ModelAndView mav, Model model) {
		Map<String, Object> map = new HashMap<>();
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		String userId = user.getUser_loginid();
		
		List<CartVo> cartInfo = cartService.cartInfo(userId);
		int sumMoney = cartService.sumMoney(userId);
		int fee = sumMoney >= 50000 ? 0 : 2500;
		
		map.put("sumMoney", sumMoney);
        map.put("fee", fee); //배송료
        map.put("sum", sumMoney+fee); //전체 금액
        model.addAttribute("cartInfo", cartInfo);
        map.put("count", cartInfo.size()); //레코드 갯수
        mav.setViewName("webFront/cart");
        System.out.println("cartInfo : " + cartInfo);
		return "webFront/cart";
	}
	
	
	
	
	
	
	
	@GetMapping("/webFront/cart")
	public String cart(Model model, HttpSession session) {
		System.out.println("ss" + session.getAttribute("loginUser"));	
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		String userId = user.getUser_loginid();
		System.out.println("제발 1 : " + userId);
		List<User> getInfo = cartService.getInfo(userId);		
		List<CartVo> cartInfo = cartService.cartInfo(userId);		
		//List<orderdetailVo> orderInfo = cartService.orderInfo(userId);		
		model.addAttribute("getInfo", getInfo);	
		model.addAttribute("cartInfo", cartInfo);	
		//model.addAttribute("orderInfo", orderInfo);	
		model.addAttribute("user", getInfo);	
		System.out.println("getInfo : " + getInfo);
		System.out.println("cartInfo : " + cartInfo);
		//System.out.println("orderInfo : " + orderInfo);
		return "webFront/cart";
	}
	
	
	
	
}
