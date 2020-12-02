package com.egg.tfox.service.approval;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.repository.approval.ApprovalDao;
import com.egg.tfox.vo.approval.ApprovalMainNoCheckVo;
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

}
