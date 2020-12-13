package com.egg.tfox.service.approval;

import java.util.HashMap;
import java.util.List;

import com.egg.tfox.entity.Employee;
import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.vo.approval.ApprovalMainNoCheckVo;
import com.egg.tfox.vo.approval.ApprovalMainVo;
import com.egg.tfox.vo.approval.ApprovalSendDocVo;

public interface ApprovalService {

	List<HashMap<String, String>> templateList(String userName);

	List<ApprovalMainVo> selectDocList(String userName);

	List<ApprovalMainVo> weekIgnore(String userName);

	List<ApprovalMainNoCheckVo> noCheck(String userName);

	HashMap<String, Object> totalDoc(String userName);

	void signEdit(String emp_ID, String signUrl);

	HashMap<String, String> selectSign(String emp_ID);

	HashMap<String, List<ApprovalSendDocVo>> sendDocListGet(String emp_id);
}
