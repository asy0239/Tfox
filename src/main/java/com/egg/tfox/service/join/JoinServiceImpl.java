package com.egg.tfox.service.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.User;
import com.egg.tfox.repository.User.JoinDao;


@Service
public class JoinServiceImpl implements JoinService {
	@Autowired
	private JoinDao joinDao;
	
	@Override
	public void userJoin(User user) {
		joinDao.userJoin(user);		
	}
	//아이디 체크
	@Override
	public String userId(String inputId) {
		String checkResult = joinDao.userId(inputId);
		return checkResult;
	}

}
