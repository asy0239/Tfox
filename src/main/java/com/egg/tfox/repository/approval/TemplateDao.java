package com.egg.tfox.repository.approval;

import java.util.HashMap;
import java.util.List;

import com.egg.tfox.entity.approval.TemplateEntity;

public interface TemplateDao {
	List<TemplateEntity> listAll();
	void insertTemplate(HashMap<String, String> templateMap);
}
