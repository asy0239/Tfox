package com.egg.tfox.service.approval;

import java.util.List;
import com.egg.tfox.vo.approval.ApprovalMainVo;

public interface ApprovalService {
	public List<ApprovalMainVo> selectDocList();
}
