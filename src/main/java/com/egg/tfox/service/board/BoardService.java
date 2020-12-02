package com.egg.tfox.service.board;

import java.util.List;

import com.egg.tfox.entity.User;
import com.egg.tfox.vo.board.GesiVO;

public interface BoardService {

	public  User login(User user);

	public List<GesiVO> selectList();

	public List selectQnaList(String gesi_code);

}
