package com.egg.tfox.service.board;

import java.util.List;
import java.util.Map;

import com.egg.tfox.vo.board.GesiVO;
import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.ProductVO;
import com.egg.tfox.vo.board.UserVO;

public interface BoardService {

	public  UserVO login(Map<String, Object> loginInfo);

	public int countBoard(Map<String, Object> mapList);

	public List<GesiVO> selectList(Map<String, Object> mapList, PageInfo pi);

	public List<ProductVO> productList();

	public List<ProductVO> productOne(Map<String, Object> productInfo);

	public List<ProductVO> detailList(String pro_name);


}
