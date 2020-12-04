package com.egg.tfox.service.approval;

import java.util.HashMap;
import java.util.List;

import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.vo.approval.ApprovalMainNoCheckVo;
import com.egg.tfox.vo.approval.ApprovalMainVo;

public interface ApprovalService {

	List<HashMap<String, String>> templateList(String userName);

	List<ApprovalMainVo> selectDocList(String userName);

	List<ApprovalMainVo> weekIgnore(String userName);

	List<ApprovalMainNoCheckVo> noCheck(String userName);

	HashMap<String, Object> totalDoc(String userName);
}
