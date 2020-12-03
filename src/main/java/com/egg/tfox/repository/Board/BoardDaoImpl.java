package com.egg.tfox.repository.Board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.entity.User;
import com.egg.tfox.vo.board.GesiVO;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sql;

	@Override
	public User login(User user) {
		return sql.selectOne("board.login", user);
	}


	@Override
	public List selectQnaList() {
		
		return null;
	}

	@Override
	public List<GesiVO> selectList(Map<String, Object> mapList) {
		// TODO Auto-generated method stub
		return sql.selectList("board.gesiList", mapList);
	}
}
