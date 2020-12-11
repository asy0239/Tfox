package com.egg.tfox.service.board;

import java.util.List;
import java.util.Map;

import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.QnaListVO;
import com.egg.tfox.vo.board.QnaType;

public interface QnaService {

	 List<QnaListVO> selectQnaList(String gesi_code, PageInfo pi);

	 int countQna(String gesi_code);

	List<QnaType> select();
}
