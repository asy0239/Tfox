package com.egg.tfox.repository.Board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.vo.board.FilesVO;
import com.egg.tfox.vo.board.GesiType;
import com.egg.tfox.vo.board.GesiVO;
import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.ProductVO;
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

	@Override
	public List<ProductVO> boardList() {
		
		return sql.selectList("board.boardList");
	}

	@Override
	public List<ProductVO> detailList(String pro_name) {
		
		return sql.selectList("board.detailList", pro_name);
	}

	@Override
	public List<ProductVO> proSize(Map<String, Object> productInfo) {
		// TODO Auto-generated method stub
		return sql.selectList("board.proSize", productInfo);
	}

	@Override
	public FilesVO imgFind(String pro_id) {
		// TODO Auto-generated method stub
		return sql.selectOne("board.find", pro_id);
	}

	@Override
	public List<ProductVO> proColor(Map<String, Object> productInfo) {
		// TODO Auto-generated method stub
		return sql.selectList("board.proColor", productInfo);
	}

	@Override
	public List<GesiType> gesipanList() {
		// TODO Auto-generated method stub
		return sql.selectList("board.gesipanList");
	}




}
