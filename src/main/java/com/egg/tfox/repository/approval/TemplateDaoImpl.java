package com.egg.tfox.repository.approval;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.egg.tfox.entity.approval.TemplateEntity;

@Repository
public class TemplateDaoImpl implements TemplateDao{

	
	@Autowired
	private SqlSession sqlSession; 
	
	@Override
	public List<TemplateEntity> listAll() {
		List<TemplateEntity> listAll = sqlSession.selectList("template.listAll");
		return listAll;
	}


	@Override
	public void insertTemplate(HashMap<String, String> templateMap) {
		System.out.println("매퍼 이전 까지 확인 : " + templateMap.get("title"));
		System.out.println("매퍼 이전 까지 확인 : " + templateMap.get("content"));
		sqlSession.insert("template.insertTemp",templateMap);
		sqlSession.update("template.ins_update",templateMap);
	}


}
