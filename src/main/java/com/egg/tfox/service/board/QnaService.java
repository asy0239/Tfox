package com.egg.tfox.service.board;

import java.util.List;
import java.util.Map;

import com.egg.tfox.vo.board.QnaListVO;



public interface QnaService {

	List<QnaListVO> selectQnaList(String gesi_code);

	
}
