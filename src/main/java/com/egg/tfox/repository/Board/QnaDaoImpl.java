package com.egg.tfox.repository.Board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.entity.User;
import com.egg.tfox.vo.board.GesiVO;
import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.QnaListVO;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Autowired
	private SqlSession sql;

	@Override
	public List<QnaListVO> selectQnaList(String gesi_code) {
		// TODO Auto-generated method stub
		return sql.selectList("qna.qnaList", gesi_code);
	}
	
}
