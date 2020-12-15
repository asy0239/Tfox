package com.egg.tfox.repository.Board;

import java.util.List;
import java.util.Map;

import com.egg.tfox.vo.board.FilesVO;
import com.egg.tfox.vo.board.GesiType;
import com.egg.tfox.vo.board.GesiVO;
import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.ProductVO;
import com.egg.tfox.vo.board.UserVO;

public interface BoardDao {

	public UserVO login(Map<String, Object> loginInfo);

	public List<GesiVO> selectList(Map<String, Object> mapList, PageInfo pi);

	public int countBoard(Map<String, Object> mapList);

	public List<ProductVO> boardList();

	public List<ProductVO> proSize(Map<String, Object> productInfo); 

	public List<ProductVO> detailList(String pro_name);

	public FilesVO imgFind(String pro_id);

	public List<ProductVO> proColor(Map<String, Object> productInfo);

	public List<GesiType> gesipanList();




  
}
