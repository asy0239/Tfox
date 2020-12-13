package com.egg.tfox.service.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.repository.Board.BoardDao;
import com.egg.tfox.vo.board.GesiVO;
import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.ProductVO;
import com.egg.tfox.vo.board.UserVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	@Override
	public UserVO login(Map<String, Object> loginInfo) {
		return dao.login(loginInfo);
	}
	
	@Override
	public List<GesiVO> selectList(Map<String, Object> mapList, PageInfo pi) {
		// TODO Auto-generated method stub
		return dao.selectList(mapList,pi);
	}


	@Override
	public int countBoard(Map<String, Object> mapList) {
		// TODO Auto-generated method stub
		return dao.countBoard(mapList);
	}

	@Override
	public List<ProductVO> productList() {
		// TODO Auto-generated method stub
		return dao.boardList();
	}

	
	@Override
	public List<ProductVO> detailList(String pro_name) {
		// TODO Auto-generated method stub
		return dao.detailList(pro_name);
	}

	@Override
	public List<ProductVO> productOne(Map<String, Object> productInfo) {
		// TODO Auto-generated method stub
		return dao.productOne(productInfo);
	}



	
}
