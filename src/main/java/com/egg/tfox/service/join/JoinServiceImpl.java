package com.egg.tfox.service.join;

import com.egg.tfox.entity.User;

public class JoinServiceImpl implements JoinService {
	private User join;
	
	public void setUser(User join) {
		this.join = join;
	}

	@Override
	public void userJoin(User join) {
		//join.userJoin(join);
		
	}

}
