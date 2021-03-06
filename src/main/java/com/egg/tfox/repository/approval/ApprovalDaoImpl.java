package com.egg.tfox.repository.approval;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.cursor.Cursor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.entity.Approval;
import com.egg.tfox.entity.Employee;
import com.egg.tfox.entity.approval.TemplateEntity;
import com.egg.tfox.vo.approval.ApprovalDetailEmpVo;
import com.egg.tfox.vo.approval.ApprovalDetailRef;
import com.egg.tfox.vo.approval.ApprovalExcu;
import com.egg.tfox.vo.approval.ApprovalGetMyDoc;
import com.egg.tfox.vo.approval.ApprovalMainDocCountVo;
import com.egg.tfox.vo.approval.ApprovalMainNoCheckVo;
import com.egg.tfox.vo.approval.ApprovalMainRefVo;
import com.egg.tfox.vo.approval.ApprovalMainVo;
import com.egg.tfox.vo.approval.ApprovalSendDocVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ApprovalDaoImpl implements ApprovalDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ApprovalMainVo> selectAll(String UserName) {
		List<ApprovalMainVo> list = sqlSession.selectList("approval.docList", UserName);
		return list;
	}

	@Override
	public List<HashMap<String, String>> templateList(String UserName) {
		List<HashMap<String, String>> templateRank = sqlSession.selectList("approval.templateRankList" , UserName);		
		return templateRank;		
	}

	@Override
	public List<ApprovalMainVo> weekIgnore(String userName) {
		List<ApprovalMainVo> list = sqlSession.selectList("approval.weekIgnore", userName);
		return list;
	}

	@Override
	public List<ApprovalMainNoCheckVo> noCheck(String userName) {
		List<ApprovalMainNoCheckVo> list = sqlSession.selectList("approval.noCheck", userName);
		return list;
	}

	@Override
	public List<ApprovalMainRefVo> refDoc(String userName) {
		List<ApprovalMainRefVo> list = sqlSession.selectList("approval.refDoc", userName);
		return list;
	}

	@Override
	public void signEdit(String emp_ID, String signUrl) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("emp_id", emp_ID);
		map.put("signUrl", signUrl);
		sqlSession.update("signEdit.signUpdate", map);
		

	}

	@Override
	public HashMap<String, String> selectSign(String emp_ID) {
		HashMap<String, String> resultMap = sqlSession.selectOne("signEdit.selectEmp", emp_ID);
		return resultMap;
	}
	
	
	// 상신함 데이터 불러오기
	@Override
	public List<ApprovalSendDocVo> sendDocListGet(String emp_id) {
		int count = sqlSession.selectOne("approval.sendDocListCount",emp_id);
		List<ApprovalSendDocVo> sendDocList = sqlSession.selectList("approval.sendDocList", emp_id);
		return sendDocList;
	}
	
	@Override
	public int sendDocListCount(String emp_id) {
		int count = sqlSession.selectOne("approval.sendDocListCount",emp_id);
		return count;
	}

	@Override
	public List<ApprovalGetMyDoc> getMyDoc(String emp_id) {
		List<ApprovalGetMyDoc> getMyDocList = sqlSession.selectList("approval.selectGetMyDoc",emp_id);
		return getMyDocList;
	}

	@Override
	public HashMap<String, Object> getDocDetail(HashMap<String, String> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		ApprovalGetMyDoc docDetail = sqlSession.selectOne("approval.selectGetDetail", map);
		List<ApprovalDetailRef> docDetailRef = sqlSession.selectList("approval.selectGetDetailRef", map);
		
		String excu_id_temp = docDetail.getSend_excu_id();
		
		String[] excuIdList = excu_id_temp.split(",");
		List<ApprovalExcu> docDetailExcu = new ArrayList<ApprovalExcu>();
		for(String excuId : excuIdList) {
			ApprovalExcu temp = sqlSession.selectOne("approval.selectGetDetailExcu", excuId);
			docDetailExcu.add(temp);
		}
		resultMap.put("docDetail", docDetail);
		resultMap.put("docDetailRef", docDetailRef);
		resultMap.put("docExcu", docDetailExcu);
		return resultMap;
	}

	@Override
	public ApprovalDetailEmpVo getDetailSign(String emp_id) {
		ApprovalDetailEmpVo signVo = sqlSession.selectOne("approval.selectSign", emp_id);
		return signVo;
	}

	@Override
	public void updateApplyDoc(HashMap<String, String> map) {
		sqlSession.update("approval.updateCheckApply", map);
	}
}