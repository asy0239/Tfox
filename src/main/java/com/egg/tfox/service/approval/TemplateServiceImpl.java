package com.egg.tfox.service.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.repository.approval.TemplateDao;

@Service
public class TemplateServiceImpl implements TemplateService{
	
	@Autowired
	private TemplateDao templateDao;
	
	@Override
	public List<TemplateEntity> listAll() {
		List<TemplateEntity> list = templateDao.listAll();
		return list;
	}

	@Override
	public void insertTemplate(String content, String title) {
		// TODO Auto-generated method stub
		HashMap<String, String> templateMap = new HashMap<String, String>();
		templateMap.put("content", content);
		templateMap.put("title", title);
		templateDao.insertTemplate(templateMap);
	}

	
	
	
}
