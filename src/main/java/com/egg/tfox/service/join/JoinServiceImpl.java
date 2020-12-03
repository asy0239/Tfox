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

	@Override
	public String checkId(String inputId) {
		String checkResult = joinDao.checkId(inputId);
		return checkResult;
	}

}
