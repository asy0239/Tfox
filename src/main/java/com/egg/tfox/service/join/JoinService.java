package com.egg.tfox.service.join;

import com.egg.tfox.entity.User;

public interface JoinService {
	
	//회원가입
	void userJoin(User join);
	
	
	//아이디체크
	String userId(String inputId);
	
	

}
