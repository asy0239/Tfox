package com.egg.tfox.repository.approval;

import java.util.HashMap;
import java.util.List;

import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.vo.approval.ApprovalMainVo;

public interface ApprovalDao {
	List<ApprovalMainVo> selectAll();

	HashMap<Integer, TemplateEntity> templateList(String userName);
}
