package com.egg.tfox.repository.User;

import com.egg.tfox.entity.User;

public interface Dao {
	
	
	
	//로그인
	public User login(User user);
	
	//회원가입
	public void userJoin(User join);
  
}