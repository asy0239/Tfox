package com.egg.tfox.repository.User;

import com.egg.tfox.entity.User;

public interface JoinDao {
	//회원가입
	void userJoin(User user);
	// 아이디 체크
	String userId(String inputId);
  
}