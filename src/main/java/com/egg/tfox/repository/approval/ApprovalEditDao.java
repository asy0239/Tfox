package com.egg.tfox.repository.approval;

import java.util.List;

import com.egg.tfox.vo.approval.ApprovalEditDocVo;
import com.egg.tfox.vo.approval.ApprovalEditEmpVo;
import com.egg.tfox.vo.approval.ApprovalEmpPos;

public interface ApprovalEditDao {

	List<ApprovalEditEmpVo> searchEmpList(String emp_ID);

	void insertAppDoc(ApprovalEditDocVo appDoc, List<String> ref_list, List<String> approval_list,
			List<String> excu_list);

	List<ApprovalEmpPos> searchEmp_pos(List<String> list);

}
