package com.egg.tfox.service.board;

import java.util.List;
import java.util.Map;

import com.egg.tfox.entity.User;
import com.egg.tfox.vo.board.GesiVO;

public interface BoardService {

	public  User login(User user);

	public List selectQnaList(String gesi_code);

	public List<GesiVO> selectList(Map<String, Object> mapList);

}
