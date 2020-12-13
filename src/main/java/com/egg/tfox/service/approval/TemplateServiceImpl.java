package com.egg.tfox.service.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.repository.approval.TemplateDao;
import com.egg.tfox.vo.approval.ManageTempVo;

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
	public void insertTemplate(String content, String title, String emp_id) {
		HashMap<String, String> templateMap = new HashMap<String, String>();
		templateMap.put("content", content);
		templateMap.put("title", title);
		templateMap.put("emp_id", emp_id);
		templateDao.insertTemplate(templateMap);
	}

	@Override
	public String getTempContent(String tempName) {
		String tempContent = templateDao.getTempContent(tempName);
		return tempContent;
	}

	@Override
	public List<ManageTempVo> allSelectTemp(String emp_id) {
		List<ManageTempVo> allTempList = templateDao.allSelectTemp(emp_id);
		return allTempList;
	}

	
	
	
}
