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

}
