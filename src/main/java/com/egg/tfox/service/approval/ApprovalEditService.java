package com.egg.tfox.service.approval;

import java.util.List;

import com.egg.tfox.entity.Employee;
import com.egg.tfox.vo.approval.ApprovalEditDocVo;
import com.egg.tfox.vo.approval.ApprovalEditEmpVo;

public interface ApprovalEditService {

	String searchEmpList(String emp_ID);

	void insertAppDoc(ApprovalEditDocVo appDoc);
	
}
