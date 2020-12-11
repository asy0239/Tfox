package com.egg.tfox.service.cart;

import java.util.HashMap;
import java.util.List;

import com.egg.tfox.controller.cart.Cart;
import com.egg.tfox.entity.User;
import com.egg.tfox.vo.cart.CartVo;
import com.egg.tfox.vo.cart.orderdetailVo;
import com.egg.tfox.vo.cart.proVo;

import lombok.extern.slf4j.Slf4j;


public interface cartService {
	//장바구니 정보
	//List<CartVo> cartInfo();
	//유저 기본배송지
	List<User> getInfo(String userId);
	//상품 정보
	List<proVo> proInfo(String userId);
	//상품 주문 정보
	List<orderdetailVo> orderInfo(String userId);
}
