package com.egg.tfox.repository.Board;

import java.util.List;
import java.util.Map;

import com.egg.tfox.entity.User;
import com.egg.tfox.vo.board.GesiVO;
import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.QnaListVO;
import com.egg.tfox.vo.board.QnaType;

public interface QnaDao {

	List<QnaListVO> selectQnaList(String gesi_code, PageInfo pi);

	int countQna(String gesi_code);

	List<QnaType> select();

	int qnaAdd(Map<String, Object> qnaAdd);

	List<GesiVO> lately(Map<String, Object> qnaAdd);

	int qnaAdd2(Map<String, Object> latelyList);

	List<QnaListVO> detailList(String gesi_id);

	int countDelQna(List<String> gesi_id);

	int gesiDel(List<String> gesi_id);




  
}
