package com.egg.tfox.service.board;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.egg.tfox.repository.Board.BoardDao;
import com.egg.tfox.vo.board.FilesVO;
import com.egg.tfox.vo.board.GesiType;
import com.egg.tfox.vo.board.GesiVO;
import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.ProductVO;
import com.egg.tfox.vo.board.UserVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	@Override
	public UserVO login(Map<String, Object> loginInfo) {
		return dao.login(loginInfo);
	}
	
	@Override
	public List<GesiVO> selectList(Map<String, Object> mapList, PageInfo pi) {
		// TODO Auto-generated method stub
		return dao.selectList(mapList,pi);
	}


	@Override
	public int countBoard(Map<String, Object> mapList) {
		// TODO Auto-generated method stub
		return dao.countBoard(mapList);
	}

	@Override
	public List<ProductVO> productList() {
		// TODO Auto-generated method stub
		return dao.boardList();
	}

	
	@Override
	public List<ProductVO> detailList(String pro_name) {
		// TODO Auto-generated method stub
		return dao.detailList(pro_name);
	}

	@Override
	public List<ProductVO> proSize(Map<String, Object> productInfo) {
		// TODO Auto-generated method stub
		return dao.proSize(productInfo);
	}

	@Override
	public ResponseEntity<ByteArrayResource> fileList(String pro_id, String filePath) throws IOException {
		FilesVO image = dao.imgFind(pro_id);
		
		if(image == null) {
			return ResponseEntity.notFound().build();
		}
		
		/*
		 * "C:\\Users\\user\\Desktop\\upload
		 */		File target = new File(filePath, image.getFile_changeName());
		byte[] data = FileUtils.readFileToByteArray(target);
		
		System.out.println(target);
		System.out.println("data : "+ data);
		
		ByteArrayResource resource = new ByteArrayResource(data);
		ResponseEntity<ByteArrayResource> entity = 
				ResponseEntity.ok()
						.header("Content-Length", image.getFile_size())
						.header("Content-Type", "application/octet-stream; charset=UTF-8")
						.header("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(image.getFile_changeName(), "UTF-8")+"\"")
					.body(resource);
		
		return entity;
	}

	@Override
	public List<ProductVO> proColor(Map<String, Object> productInfo) {
		// TODO Auto-generated method stub
		return dao.proColor(productInfo);
	}

	@Override
	public List<GesiType> gesipanList() {
		
		return dao.gesipanList();
	}

	
}
