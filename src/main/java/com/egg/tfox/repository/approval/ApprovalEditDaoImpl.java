package com.egg.tfox.repository.approval;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.vo.approval.ApprovalEditDocVo;
import com.egg.tfox.vo.approval.ApprovalEditEmpVo;
import com.egg.tfox.vo.approval.ApprovalEditRefVo;
import com.egg.tfox.vo.approval.ApprovalEditStVo;
import com.egg.tfox.vo.approval.ApprovalEmpPos;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ApprovalEditDaoImpl implements ApprovalEditDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ApprovalEditEmpVo> searchEmpList(String emp_ID) {
		List<ApprovalEditEmpVo> list = sqlSession.selectList("appEmp.employee", emp_ID);
		return list;
	}

	@Override
	public void insertAppDoc(ApprovalEditDocVo appDoc, List<String> ref_list, List<String> approval_list,
			List<String> excu_list) {
		String temp_id = sqlSession.selectOne("approval.selectTempId" , appDoc.getTemp_name());
		String emp_id = sqlSession.selectOne("approval.selectEmpId", appDoc.getEmp_name());
		appDoc.setTemp_id(temp_id);
		appDoc.setEmp_id(emp_id);
		log.info("doc : " + appDoc);
//		sqlSession.insert("approval.insertTotalDoc",appDoc);
		sqlSession.insert("approval.docInsert",appDoc);
		String doc_id = sqlSession.selectOne("approval.selectDoc_id", appDoc);
		appDoc.setApp_id(doc_id);
		log.info("appDoc : " + appDoc);
		for(int i = 0; i < appDoc.getRef_emp_id().size(); i++) {
			ApprovalEditRefVo refDoc = new ApprovalEditRefVo();
			refDoc.setApp_id(appDoc.getApp_id());
			refDoc.setRef_id(appDoc.getRef_emp_id().get(i));
									
			sqlSession.insert("approval.refInsert", refDoc);			
		}
		for(int i = 0; i < appDoc.getApproval_emp_id().size(); i++) {
			ApprovalEditStVo stDoc = new ApprovalEditStVo();
			stDoc.setApp_id(appDoc.getApp_id());
			stDoc.setAppr(appDoc.getApproval_emp_id().get(i));
			stDoc.setApproderCode(""+(i+1));
			sqlSession.insert("approval.stInsert", stDoc);
		}
		
	}
	
	@Override
	public List<ApprovalEmpPos> searchEmp_pos(List<String> empList) {
		
		List<ApprovalEmpPos> result = sqlSession.selectList("approval.selectEmp_pos" , empList);
		return result;
	}
}
