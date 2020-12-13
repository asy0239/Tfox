package com.egg.tfox.repository.approval;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.vo.approval.ManageTempVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
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
		sqlSession.insert("template.insertTemp",templateMap);
		sqlSession.update("template.ins_update",templateMap);
	}


	@Override
	public String getTempContent(String tempName) {
		String tempContent = sqlSession.selectOne("template.selectContent", tempName);		
		return tempContent;
	}


	@Override
	public List<ManageTempVo> allSelectTemp(String emp_id) {
		List<ManageTempVo> allTempList = sqlSession.selectList("template.selectAll",emp_id);
		return allTempList;
	}


}
