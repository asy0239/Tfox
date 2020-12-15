package com.egg.tfox.repository.approval;

import java.util.HashMap;
import java.util.List;

import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.vo.approval.ManageTempVo;

public interface TemplateDao {
	List<TemplateEntity> listAll();
	void insertTemplate(HashMap<String, String> templateMap);
	String getTempContent(String tempName);
	List<ManageTempVo> allSelectTemp(String emp_id);
	ManageTempVo manageDetail(String temp_id);
	void updateTemplate(HashMap<String, String> templateMap);
}
