package com.egg.tfox.service.approval;

import java.util.List;
import com.egg.tfox.vo.approval.ApprovalMainVo;

public interface ApprovalService {
	List<ApprovalMainVo> selectDocList();
	int overWeekDay();
	int noCheckDoc();
	int allDoc();
}
