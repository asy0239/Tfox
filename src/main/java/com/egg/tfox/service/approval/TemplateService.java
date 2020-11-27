package com.egg.tfox.service.approval;

import java.util.List;

import com.egg.tfox.entity.approval.TemplateEntity;

public interface TemplateService {
	List<TemplateEntity> listAll();
	
	void insertTemplate(String content, String title);
}
