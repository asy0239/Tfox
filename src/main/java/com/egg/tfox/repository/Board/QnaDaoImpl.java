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
import com.egg.tfox.vo.board.QnaType;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Autowired
	private SqlSession sql;

	@Override
	public int countQna(String gesi_code) {
		// TODO Auto-generated method stub
		return sql.selectOne("qna.countQna", gesi_code);
	}

	@Override
	public List<QnaListVO> selectQnaList(String gesi_code, PageInfo pi) {
		Map<String, Object> qnaList = new HashMap<>();
		qnaList.put("gesiC", gesi_code);
		qnaList.put("start", pi.getStart());	
		qnaList.put("end", pi.getEnd());	
		
		return sql.selectList("qna.qnaList", qnaList);
	}

	@Override
	public List<QnaType> select() {
		// TODO Auto-generated method stub
		return sql.selectList("qna.type");
	}

	@Override
	public int qnaAdd(Map<String, Object> qnaAdd) {
		// TODO Auto-generated method stub
		return sql.insert("qna.qadd", qnaAdd);
	}

	@Override
	public List<GesiVO> lately(Map<String, Object> qnaAdd) {
		// TODO Auto-generated method stub
		return sql.selectList("qna.lately", qnaAdd);
	}

	@Override
	public int qnaAdd2(Map<String, Object> latelyList) {
		// TODO Auto-generated method stub
		return sql.insert("qna.add2", latelyList);
	}

	@Override
	public List<QnaListVO> detailList(String gesi_id) {
		
		return sql.selectList("qna.detail", gesi_id);
	}

	@Override
	public int countDelQna(List<String> gesi_id) {
		int count =0;
		
		for(int i = 0; i < gesi_id.size(); i++) {
			int count2 = sql.delete("qna.delQna", gesi_id.get(i));
			
			if (count2 == 1 ) {
				
				count +=1;
			}
		}
		
		if(count == gesi_id.size()) {
			count = 1;
		}
		
		return count;
	}

	@Override
	public int gesiDel(List<String> gesi_id) {
int count =0;
		
		for(int i = 0; i < gesi_id.size(); i++) {
			int count2 = sql.delete("qna.delQna", gesi_id.get(i));
			
			if (count2 == 1 ) {
				
				count +=1;
			}
		}
		
		if(count == gesi_id.size()) {
			count = 1;
		}
		
		return count;
	}
	
}
