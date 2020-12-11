package com.egg.tfox.service.approval;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Spliterator;

import javax.print.attribute.HashPrintJobAttributeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.Employee;
import com.egg.tfox.repository.approval.ApprovalEditDao;
import com.egg.tfox.vo.approval.ApprovalEditDocVo;
import com.egg.tfox.vo.approval.ApprovalEditEmpVo;
import com.egg.tfox.vo.approval.ApprovalEmpPos;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ApprovalEditServiceImpl implements ApprovalEditService {

	@Autowired
	private ApprovalEditDao approvalEditDao;
	
	@Override
	public String searchEmpList(String emp_ID) {
		List<ApprovalEditEmpVo> list = approvalEditDao.searchEmpList(emp_ID);
		Gson gson = new Gson();
		List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String,Object>>(); // 맵의 리스트
		List<HashMap<String, String>> tempList;
		
		// hashset을 이용한 부서 이름 중복 제거
		HashSet<String> hset = new HashSet<String>();
		for(ApprovalEditEmpVo emp : list) {
			hset.add(emp.getDept_name());
		}
		// 부서 이름 리스트 생성
		Iterator<String> deptName = hset.iterator();
		List<String> deptNameList = new ArrayList<String>();
		for(int i = 0; i < hset.size(); i++) {
			deptNameList.add(deptName.next());
		}
		// 부서별 사원 데이터 생성
		for(int i = 0; i < deptNameList.size(); i++) {
			HashMap<String, Object> totalMap = new HashMap<String, Object>(); // 데이터를 넣을 맵
			tempList = new ArrayList<HashMap<String, String>>();
			for(int j = 0; j < list.size(); j++) {
				if(deptNameList.get(i).equals(list.get(j).getDept_name())) {
					HashMap<String, String> empMap = new HashMap<String, String>(); // 데이터를 넣을 맵
					empMap.put("employeeName", list.get(j).getEmp_name());
					empMap.put("value", list.get(j).getEmp_id());
					tempList.add(empMap);		
				}
			}
			
			totalMap.put("groupName", deptNameList.get(i));
			totalMap.put("groupData", tempList);				
			
			mapList.add(totalMap);
		}	
		
		String result = gson.toJson(mapList);
		return result;
	}

	@Override
	public void insertAppDoc(ApprovalEditDocVo appDoc) {
		
		// 참조자, 결재자, 시행자 리스트화
		List<String> ref_list = new ArrayList<String>();
		List<String> approval_list = new ArrayList<String>();
		List<String> excu_list = new ArrayList<String>();
		
//		String[] ref_split = appDoc.getRef_emp_id().split(",");
//		String[] approval_split = appDoc.getApproval_emp_id().split(",");
//		String[] excu_split = appDoc.getApp_excu_id().split(",");
//		for(int i = 0; i < ref_split.length; i++) {
//			ref_list.add(ref_split[i].trim());
//		}
//		for(int i = 0; i < approval_split.length; i++) {
//			approval_list.add(approval_split[i].trim());
//		}
//		for(int i = 0; i < excu_split.length; i++) {
//			excu_list.add(excu_split[i].trim());
//		}
//		
		// apporder_code 를 위한 직급vo 불러오기
//		List<ApprovalEmpPos> refEmpPos = approvalEditDao.searchEmp_pos(ref_list);
//		List<ApprovalEmpPos> approvalEmpPos = approvalEditDao.searchEmp_pos(approval_list);
//		List<ApprovalEmpPos> excuEmpPos = approvalEditDao.searchEmp_pos(excu_list);
		
		approvalEditDao.insertAppDoc(appDoc, ref_list, approval_list, excu_list);
//		approvalEditDao.insertAppDoc(appDoc , Ref_list, approval_list, excu_list);
	}
	
}
