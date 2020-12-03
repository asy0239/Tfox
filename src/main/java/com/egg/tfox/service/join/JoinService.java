package com.egg.tfox.service.join;

import com.egg.tfox.entity.User;

public interface JoinService {
	void userJoin(User join);
	
	String checkId(String inputId);
	
	

}
