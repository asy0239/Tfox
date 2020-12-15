package com.egg.tfox.service.approval;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.Employee;
import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.repository.approval.ApprovalDao;
import com.egg.tfox.vo.approval.ApprovalDetailEmpVo;
import com.egg.tfox.vo.approval.ApprovalGetMyDoc;
import com.egg.tfox.vo.approval.ApprovalMainNoCheckVo;
import com.egg.tfox.vo.approval.ApprovalMainRefVo;
import com.egg.tfox.vo.approval.ApprovalMainVo;
import com.egg.tfox.vo.approval.ApprovalSendDocVo;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class ApprovalServiceImpl implements ApprovalService{

	@Autowired
	private ApprovalDao approvalDao;
	
	@Override
	public List<ApprovalMainVo> selectDocList(String userName) {
		return approvalDao.selectAll(userName);
	}

	@Override
	public List<HashMap<String, String>> templateList(String userName) {
		// TODO Auto-generated method stub
		List<HashMap<String, String>> templateList = approvalDao.templateList(userName);
		return templateList;
	}

	@Override
	public List<ApprovalMainVo> weekIgnore(String userName) {
		List<ApprovalMainVo> list = approvalDao.weekIgnore(userName);
		return list;
	}

	@Override
	public List<ApprovalMainNoCheckVo> noCheck(String userName) {
		List<ApprovalMainNoCheckVo> list = approvalDao.noCheck(userName);
		return list;
	}

	@Override
	public HashMap<String, Object> totalDoc(String userName) {
		List<ApprovalMainRefVo> refList = approvalDao.refDoc(userName);
		List<ApprovalMainNoCheckVo> noCheckList = approvalDao.noCheck(userName);
		List<ApprovalMainVo> sendList = approvalDao.selectAll(userName);
		HashMap<String, Object> list = new HashMap<String, Object>();
		list.put("refList", refList);
		list.put("noCheckList", noCheckList);
		list.put("sendList", sendList);
		return list;
	}

	@Override
	public void signEdit(String emp_ID, String signUrl) {
		approvalDao.signEdit(emp_ID, signUrl);
	}

	@Override
	public HashMap<String, String> selectSign(String emp_ID) {
		HashMap<String, String> sign = approvalDao.selectSign(emp_ID);
		return sign;
	}

	@Override
	public HashMap<String, Object> sendDocListGet(String emp_id) {
		List<ApprovalSendDocVo> sendTotalDocList = approvalDao.sendDocListGet(emp_id);
		List<ApprovalSendDocVo> sendIngDocList = new ArrayList<ApprovalSendDocVo>();
		List<ApprovalSendDocVo> sendNoDocList = new ArrayList<ApprovalSendDocVo>();
		List<ApprovalSendDocVo> sendOkDocList = new ArrayList<ApprovalSendDocVo>();
		List<ApprovalSendDocVo> containsDocList = new ArrayList<ApprovalSendDocVo>();
		
		for(ApprovalSendDocVo list : sendTotalDocList) {
			if(list.getSt_apply().equals("결재중")) {
				sendIngDocList.add(list);
			} else if (list.getSt_apply().equals("반려")) {
				sendNoDocList.add(list);
			} else {
				sendOkDocList.add(list);
			}
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sendTotalDocList", sendTotalDocList);
		map.put("sendIngDocList", sendIngDocList);
		map.put("sendNoDocList", sendNoDocList);
		map.put("sendOkDocList", sendOkDocList);
		map.put("sendContainsDocCount", sendTotalDocList);
		return map;
	}

	@Override
	public List<ApprovalGetMyDoc> getMyDoc(String emp_id) {
		List<ApprovalGetMyDoc> getMyDocList = approvalDao.getMyDoc(emp_id);
		return getMyDocList;
	}

	@Override
	public HashMap<String, Object> getDetail(HashMap<String, String> map) {
		HashMap<String, Object> getDetailDoc = approvalDao.getDocDetail(map);
		return getDetailDoc;
	}

	@Override
	public ApprovalDetailEmpVo getDetailSign(String emp_id) {
		ApprovalDetailEmpVo signVo = approvalDao.getDetailSign(emp_id);
		return signVo;
	}

	@Override
	public void applyDoc(HashMap<String, String> map) {
		approvalDao.updateApplyDoc(map);
	}

}
