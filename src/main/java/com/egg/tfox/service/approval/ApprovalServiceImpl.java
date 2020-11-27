package com.egg.tfox.service.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.repository.approval.ApprovalDao;
import com.egg.tfox.vo.approval.ApprovalMainVo;


@Service
public class ApprovalServiceImpl implements ApprovalService{

	@Autowired
	private ApprovalDao approvalDao;
	
	@Override
	public List<ApprovalMainVo> selectDocList() {
		return approvalDao.selectAll();
	}

	@Override
	public int overWeekDay() {
		int count = approvalDao.overWeekDay();
		return count;
	}

	@Override
	public int noCheckDoc() {
		int count = approvalDao.noCheckDoc();
		return count;
	}

	@Override
	public int allDoc() {
		int count = approvalDao.allDoc();
		return count;
	}

}
