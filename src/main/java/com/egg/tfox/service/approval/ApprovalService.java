package com.egg.tfox.service.approval;

import java.util.HashMap;
import java.util.List;

import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.vo.approval.ApprovalMainVo;

public interface ApprovalService {
	List<ApprovalMainVo> selectDocList();

	HashMap<Integer, TemplateEntity> templateList(String userName);
}
