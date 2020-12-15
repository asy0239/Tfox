package com.egg.tfox.controller.payment;

import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.egg.tfox.entity.User;
import com.egg.tfox.service.payment.PayService;
import com.egg.tfox.vo.board.UserVO;
import com.egg.tfox.vo.cart.CartVo;
import com.egg.tfox.vo.payment.PayApproveResult;
import com.egg.tfox.vo.payment.PayRequestReady;
import com.egg.tfox.vo.payment.PayRequestResult;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/webFront")
public class PaymentContoller {

	@Autowired
	private PayService PayService;
	
	@GetMapping("/confirm")
	public String confirm() {
		return "webFront/cart";
	}
	@RequestMapping(value="webFront/cart", method=RequestMethod.GET)
	public String userlist() {
		List<User> userlist = PayService.userlist();
		return "/cart";
	}
	
	@PostMapping("/confirm")
	public String confirm(HttpSession session,
					@ModelAttribute PayRequestReady ready) throws URISyntaxException {
		ready.setPartner_order_id(UUID.randomUUID().toString());
		ready.setPartner_user_id(UUID.randomUUID().toString());
		Map<String, Object> maplist = new HashMap<>();
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		String userId = user.getUser_loginid();
		//List<CartVo> uplist;
		//uplist = PayService.uplist(maplist);
		
		PayRequestResult result = PayService.request(ready, userId);
		System.out.println("ready"+ready);
						return "redirect:" +result.getNext_redirect_pc_url();
		
	}
	@GetMapping("/success")
	public String success (@RequestParam int no,
					       @RequestParam String pg_token)  throws URISyntaxException {
		PayApproveResult result = PayService.approve(no, pg_token);
		
		return "redirect:search?no="+no;
	}
}









