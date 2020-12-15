package com.egg.tfox.service.approval;

import java.util.List;

import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.vo.approval.ManageTempVo;

public interface TemplateService {
	List<TemplateEntity> listAll();
	
	void insertTemplate(String content, String title, String emp_id);

	String getTempContent(String tempName);

	List<ManageTempVo> allSelectTemp(String string);

	ManageTempVo manageDetail(String temp_id);

	void updateTemplate(String editorContent, String tempTitle, String emp_id, String temp_id);
}
