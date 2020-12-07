package com.egg.tfox.repository.Board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.vo.board.GesiVO;
import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.UserVO;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sql;

	@Override
	public UserVO login(Map<String, Object> loginInfo) {
		// TODO Auto-generated method stub
		return sql.selectOne("board.login", loginInfo);
	}

	@Override
	public List<GesiVO> selectList(Map<String, Object> mapList, PageInfo pi) {
		Map<String, Object> searchList = new HashMap<>();
		searchList.put("startD", mapList.get("startD"));
		searchList.put("endD", mapList.get("endD"));
		searchList.put("gesi_code", mapList.get("gesi_code"));
		searchList.put("searchType", mapList.get("searchType"));
		searchList.put("keyword", mapList.get("keyword"));
		searchList.put("start", pi.getStart());	
		searchList.put("end", pi.getEnd());	
			
		return sql.selectList("board.gesiList", searchList);
	}


	@Override
	public int countBoard(Map<String, Object> mapList) {
		// TODO Auto-generated method stub
		return sql.selectOne("board.countBoard", mapList);
	}



}
