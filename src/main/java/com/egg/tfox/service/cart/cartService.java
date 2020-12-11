package com.egg.tfox.service.cart;

import java.util.HashMap;
import java.util.List;

import com.egg.tfox.entity.User;
import com.egg.tfox.vo.cart.proVo;

public interface cartService {
	//유저 기본배송지
	List<User> getinfo();
	//상품 정보
	List<proVo> proinfo();
	
	
		
		
	
}
