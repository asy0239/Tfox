package com.egg.tfox.repository.approval;

import java.util.HashMap;
import java.util.List;

import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.vo.approval.ApprovalMainNoCheckVo;
import com.egg.tfox.vo.approval.ApprovalMainVo;

public interface ApprovalDao {
	List<HashMap<String, String>> templateList(String userName);
	List<ApprovalMainVo> selectAll(String UserName);
	List<ApprovalMainVo> weekIgnore(String userName);
	List<ApprovalMainNoCheckVo> noCheck(String userName);
	
	
}
