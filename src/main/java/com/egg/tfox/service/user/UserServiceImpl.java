package com.egg.tfox.service.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.egg.tfox.entity.User;
import com.egg.tfox.repository.User.userListDao;
import com.egg.tfox.vo.user.PaginInfo;
import com.egg.tfox.vo.user.UserVo;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private userListDao userlistDao;

	@Override
	public int countUser(Map<String, Object> maplist) {
		return userlistDao.countUser(maplist);
	}

	@Override
	public List<UserVo> userlist(Map<String, Object> maplist, PaginInfo pi) {
		return userlistDao.userlist(maplist, pi);
	}

	/*
	 * @Override public List<User> userlist() {
	 * 
	 * return userlistDao.userlist(); }
	 */

}
