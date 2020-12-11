package com.egg.tfox.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.repository.Board.QnaDao;
import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.QnaListVO;
import com.egg.tfox.vo.board.QnaType;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao dao;

	@Override
	public int countQna(String gesi_code) {
		// TODO Auto-generated method stub
		return dao.countQna(gesi_code);
	}

	@Override
	public List<QnaListVO> selectQnaList(String gesi_code, PageInfo pi) {
		// TODO Auto-generated method stub
		return dao.selectQnaList(gesi_code, pi);
	}

	@Override
	public List<QnaType> select() {
		// TODO Auto-generated method stub
		return dao.select();
	}
	

	
}
