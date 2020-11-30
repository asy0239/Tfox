package com.egg.tfox.repository.approval;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.cursor.Cursor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.vo.approval.ApprovalMainDocCountVo;
import com.egg.tfox.vo.approval.ApprovalMainVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ApprovalDaoImpl implements ApprovalDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ApprovalMainVo> selectAll() {
		List<ApprovalMainVo> list = sqlSession.selectList("approval.docList");
		return sqlSession.selectList("approval.docList");
	}

	@Override
	public HashMap<Integer, TemplateEntity> templateList(String UserName) {
		List<Object> template = sqlSession.selectList("approval.templateAll");		
		List<HashMap<String, String>> templateRank = sqlSession.selectList("approval.templateRankList" , UserName);
		log.info("rank : " + templateRank);
		log.info("tmp_id : " + templateRank.get(0).get("TEMP_ID"));
		return null;
		
	}
}