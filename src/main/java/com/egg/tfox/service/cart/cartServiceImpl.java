package com.egg.tfox.service.cart;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.User;
import com.egg.tfox.repository.User.userListDao;
import com.egg.tfox.repository.cart.cartDao;
import com.egg.tfox.vo.cart.proVo;

@Service
public class cartServiceImpl implements cartService {
	@Autowired
	private userListDao userlistDao;
	@Autowired
	private cartDao cartDao;
	@Override
	public List<User> getinfo() {		
		return userlistDao.getinfo();
	}
	@Override
	public List<proVo> proinfo() {
		
		return cartDao.proinfo();
	}
	/*
	 * @Override public HashMap<String, Object> cartinfo(String userid) {
	 * 
	 * return null; }
	 */

}
