package com.egg.tfox.service.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.repository.Board.QnaDao;
import com.egg.tfox.vo.board.GesiVO;
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

	@Override
	public int qnaAdd(Map<String, Object> qnaAdd) {
		// TODO Auto-generated method stub
		return dao.qnaAdd(qnaAdd);
	}

	@Override
	public List<GesiVO> lately(Map<String, Object> qnaAdd) {
		// TODO Auto-generated method stub
		return dao.lately(qnaAdd);
	}

	@Override
	public int qnaAdd2(Map<String, Object> latelyList) {
		// TODO Auto-generated method stub
		return dao.qnaAdd2(latelyList);
	}

	@Override
	public List<QnaListVO> detailList(String gesi_id) {
		// TODO Auto-generated method stub
		return dao.detailList(gesi_id);
	}

	@Override
	public int countDelQna(List<String> gesi_id) {
		// TODO Auto-generated method stub
		return dao.countDelQna(gesi_id);
	}

	@Override
	public int gesiDel(List<String> gesi_id) {
		// TODO Auto-generated method stub
		return dao.gesiDel(gesi_id);
	}
	

	
}
