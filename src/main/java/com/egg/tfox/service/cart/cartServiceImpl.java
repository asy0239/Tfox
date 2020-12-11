package com.egg.tfox.service.cart;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.controller.cart.Cart;
import com.egg.tfox.entity.User;
import com.egg.tfox.repository.User.userListDao;
import com.egg.tfox.repository.cart.cartDao;
import com.egg.tfox.vo.cart.CartVo;
import com.egg.tfox.vo.cart.orderdetailVo;
import com.egg.tfox.vo.cart.proVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class cartServiceImpl implements cartService {
	@Autowired
	private cartDao cartDao;

	//@Override
	//public List<CartVo> cartInfo() {
		
	//	return cartDao.cartInfo();
	//}

	
	 @Override public List<User> getInfo(String userId) {
		 return cartDao.getInfo(userId); 
		 }
	 
	
	 @Override public List<proVo> proInfo(String userId) {
	  
	 return cartDao.proInfo(userId); }
	 
	
	 @Override public List<orderdetailVo> orderInfo(String userId) {
	 
	 return cartDao.orderInfo(userId);
	 }
	 

}
