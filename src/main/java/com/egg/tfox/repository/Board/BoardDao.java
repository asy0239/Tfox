package com.egg.tfox.repository.Board;

import java.util.List;
import java.util.Map;

import com.egg.tfox.vo.board.GesiVO;
import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.UserVO;

public interface BoardDao {

	public UserVO login(Map<String, Object> loginInfo);

	public List<GesiVO> selectList(Map<String, Object> mapList, PageInfo pi);

	public int countBoard(Map<String, Object> mapList);


  
}
