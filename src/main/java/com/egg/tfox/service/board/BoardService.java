package com.egg.tfox.service.board;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;

import com.egg.tfox.vo.board.GesiType;
import com.egg.tfox.vo.board.GesiVO;
import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.ProductVO;
import com.egg.tfox.vo.board.UserVO;

public interface BoardService {

	public  UserVO login(Map<String, Object> loginInfo);

	public int countBoard(Map<String, Object> mapList);

	public List<GesiVO> selectList(Map<String, Object> mapList, PageInfo pi);

	public List<ProductVO> productList();

	public List<ProductVO> detailList(String pro_name);

	public ResponseEntity<ByteArrayResource> fileList(String pro_id, String filePath) throws IOException;

	public List<ProductVO> proSize(Map<String, Object> productInfo);

	public List<ProductVO> proColor(Map<String, Object> productInfo);

	public List<GesiType> gesipanList();



}
