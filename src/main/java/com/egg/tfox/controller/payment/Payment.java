package com.egg.tfox.controller.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.egg.tfox.service.payment.PayService;

@Controller
/* @RequestMapping("/pay") */
public class Payment {

//	@Autowired
//	private PayService payService;
	
	//주문/결제 confirm 페이지
	@GetMapping("/confirm")
	public String confirm() {
		return "payment/confirm";
		//return "pay/confirm;
	}
	
	
}
