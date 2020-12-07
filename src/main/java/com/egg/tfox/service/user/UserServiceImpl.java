package com.egg.tfox.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.User;
import com.egg.tfox.repository.User.userListDao;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private userListDao userlistDao;

	@Override
	public List<User> userlist() {
		
		return userlistDao.userlist();
	}

}
