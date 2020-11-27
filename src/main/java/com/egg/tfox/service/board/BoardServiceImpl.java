package com.egg.tfox.service.board;

import org.springframework.beans.factory.annotation.Autowired;

import com.egg.tfox.entity.User;
import com.egg.tfox.repository.Board.BoardDao;


public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	@Override
	public User login(User user) {
		return dao.login(user);
	}

	
}
