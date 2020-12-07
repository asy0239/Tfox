package com.egg.tfox.service.approval;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.repository.approval.ApprovalDao;
import com.egg.tfox.vo.approval.ApprovalMainNoCheckVo;
import com.egg.tfox.vo.approval.ApprovalMainRefVo;
import com.egg.tfox.vo.approval.ApprovalMainVo;

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

}
