package com.egg.tfox.service.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.User;
import com.egg.tfox.repository.Board.BoardDao;
import com.egg.tfox.vo.board.GesiVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	@Override
	public User login(User user) {
		return dao.login(user);
	}
	
	@Override
	public List<GesiVO> selectList(Map<String, Object> mapList) {
		// TODO Auto-generated method stub
		return dao.selectList(mapList);
	}

	@Override
	public List selectQnaList(String gesi_code) {
		// TODO Auto-generated method stub
		return null;
	}


	
}
