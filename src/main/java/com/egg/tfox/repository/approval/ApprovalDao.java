package com.egg.tfox.repository.approval;

import java.util.HashMap;
import java.util.List;

import com.egg.tfox.entity.Employee;
import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.vo.approval.ApprovalDetailEmpVo;
import com.egg.tfox.vo.approval.ApprovalGetMyDoc;
import com.egg.tfox.vo.approval.ApprovalMainNoCheckVo;
import com.egg.tfox.vo.approval.ApprovalMainRefVo;
import com.egg.tfox.vo.approval.ApprovalMainVo;
import com.egg.tfox.vo.approval.ApprovalSendDocVo;

public interface ApprovalDao {
	List<HashMap<String, String>> templateList(String userName);
	List<ApprovalMainVo> selectAll(String UserName);
	List<ApprovalMainVo> weekIgnore(String userName);
	List<ApprovalMainNoCheckVo> noCheck(String userName);
	List<ApprovalMainRefVo> refDoc(String userName);
	void signEdit(String emp_ID, String signUrl);
	HashMap<String, String> selectSign(String emp_ID);
	List<ApprovalSendDocVo> sendDocListGet(String emp_id);
	int sendDocListCount(String emp_id);
	List<ApprovalGetMyDoc> getMyDoc(String emp_id);
	HashMap<String, Object> getDocDetail(HashMap<String, String> map);
	ApprovalDetailEmpVo getDetailSign(String emp_id);
	void updateApplyDoc(HashMap<String, String> map);
	
	
}
