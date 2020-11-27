package com.egg.tfox.repository.Board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.egg.tfox.entity.User;

public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sql;

	@Override
	public User login(User user) {
		return sql.selectOne("board.login", user);
	}
}
