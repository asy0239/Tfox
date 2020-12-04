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

import com.egg.tfox.entity.Approval;
import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.vo.approval.ApprovalMainDocCountVo;
import com.egg.tfox.vo.approval.ApprovalMainNoCheckVo;
import com.egg.tfox.vo.approval.ApprovalMainRefVo;
import com.egg.tfox.vo.approval.ApprovalMainVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ApprovalDaoImpl implements ApprovalDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ApprovalMainVo> selectAll(String UserName) {
		List<ApprovalMainVo> list = sqlSession.selectList("approval.docList", UserName);
		return list;
	}

	@Override
	public List<HashMap<String, String>> templateList(String UserName) {
		List<HashMap<String, String>> templateRank = sqlSession.selectList("approval.templateRankList" , UserName);		
		return templateRank;		
	}

	@Override
	public List<ApprovalMainVo> weekIgnore(String userName) {
		List<ApprovalMainVo> list = sqlSession.selectList("approval.weekIgnore", userName);
		return list;
	}

	@Override
	public List<ApprovalMainNoCheckVo> noCheck(String userName) {
		List<ApprovalMainNoCheckVo> list = sqlSession.selectList("approval.noCheck", userName);
		return list;
	}

	@Override
	public List<ApprovalMainRefVo> refDoc(String userName) {
		List<ApprovalMainRefVo> list = sqlSession.selectList("approval.refDoc", userName);
		return list;
	}
	
}