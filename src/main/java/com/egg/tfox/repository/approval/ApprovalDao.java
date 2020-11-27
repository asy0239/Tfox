package com.egg.tfox.repository.approval;

import java.util.List;

import com.egg.tfox.vo.approval.ApprovalMainVo;

public interface ApprovalDao {
	List<ApprovalMainVo> selectAll();
	int overWeekDay();
	int noCheckDoc();
	int allDoc();
}
