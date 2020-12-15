package com.egg.tfox.service.payment;

import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

import com.egg.tfox.entity.Payment;
import com.egg.tfox.entity.User;
import com.egg.tfox.vo.cart.CartVo;
import com.egg.tfox.vo.payment.PayApproveReady;
import com.egg.tfox.vo.payment.PayApproveResult;
import com.egg.tfox.vo.payment.PayRequestReady;
import com.egg.tfox.vo.payment.PayRequestResult;

public interface PayService {

	PayRequestResult request(PayRequestReady ready, String userId) throws URISyntaxException;
	Payment get(int no);
	Payment get(String pay_id);
	PayApproveResult approve(int no, String pg_token) throws URISyntaxException;
	PayApproveResult approve(PayApproveReady ready) throws URISyntaxException;
	
	void approveDatabase(int no);
	
	List<User> userlist();
	
	//List<CartVo> uplist(Map<String, Object> maplist);
	

}
