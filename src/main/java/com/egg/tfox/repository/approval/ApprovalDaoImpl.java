package com.egg.tfox.repository.approval;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.vo.approval.ApprovalMainVo;

@Repository
public class ApprovalDaoImpl implements ApprovalDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ApprovalMainVo> selectAll() {
		List<ApprovalMainVo> list = sqlSession.selectList("approval.docList");
		return sqlSession.selectList("approval.docList");
	}
}
	