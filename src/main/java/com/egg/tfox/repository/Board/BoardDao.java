package com.egg.tfox.repository.Board;

import java.util.List;

import com.egg.tfox.entity.User;
import com.egg.tfox.vo.board.GesiVO;

public interface BoardDao {

	public User login(User user);

	public List<GesiVO> selectList();
  
}
