package com.egg.tfox.repository.Board;

import java.util.List;
import java.util.Map;

import com.egg.tfox.entity.User;
import com.egg.tfox.vo.board.GesiVO;
import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.QnaListVO;

public interface QnaDao {

	List<QnaListVO> selectQnaList(String gesi_code);




  
}
