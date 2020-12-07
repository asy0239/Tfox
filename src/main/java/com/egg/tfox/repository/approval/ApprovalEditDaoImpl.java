package com.egg.tfox.repository.approval;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.vo.approval.ApprovalEditDocVo;
import com.egg.tfox.vo.approval.ApprovalEditEmpVo;
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
		String emp_id = sqlSession.selectOne("appproval.selectEmpId", appDoc.getEmp_name());
		appDoc.setTemp_id(temp_id);
		appDoc.setEmp_id(emp_id);
		sqlSession.insert("approval.insertDoc", appDoc);
		
		
		insertList(ref_list, appDoc);
		insertList(approval_list, appDoc);
	}
	
	@Override
	public List<ApprovalEmpPos> searchEmp_pos(List<String> list) {
		List<ApprovalEmpPos> result = new ArrayList<ApprovalEmpPos>();
		if(list.size() <= 1) {
			String listOne = list.get(0);
			result.add(sqlSession.selectOne("approval.selectEmp_pos",listOne)) ; 
		} else {
			for(String idxList : list) {
				ApprovalEmpPos tempVo = new ApprovalEmpPos();
				tempVo = sqlSession.selectOne("approval.selectEmp_pos",idxList);
				result.add(tempVo);
				
				log.info("result : " + result);
			}
		}
		return result;
	}
	// 리스트가 1개만 있으면 한번만 실행하고 1개 이상이면 그 수만큼 insert 실행
	void insertList(List<String> list, ApprovalEditDocVo appDoc) {
		if(list.size() == 1) {
			sqlSession.insert("approval.insertRefDoc", appDoc);
		} else {
			for(String idxList : list) {
				appDoc.setRef_emp_id(idxList);
				sqlSession.insert("approval.insertRefDoc", appDoc);
			}			
		}
	}
}
