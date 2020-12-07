package com.egg.tfox.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.repository.Board.QnaDao;
import com.egg.tfox.vo.board.QnaListVO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao dao;

	@Override
	public List<QnaListVO> selectQnaList(String gesi_code) {
		// TODO Auto-generated method stub
		return dao.selectQnaList(gesi_code);
	}
	

	
}
