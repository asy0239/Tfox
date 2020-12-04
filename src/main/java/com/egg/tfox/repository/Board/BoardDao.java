package com.egg.tfox.repository.Board;

import java.util.List;
import java.util.Map;

import com.egg.tfox.entity.User;
import com.egg.tfox.vo.board.GesiVO;
import com.egg.tfox.vo.board.PageInfo;

public interface BoardDao {

	public User login(User user);

	public List selectQnaList();

	public List<GesiVO> selectList(Map<String, Object> mapList, PageInfo pi);

	public int countBoard(Map<String, Object> mapList);
  
}
