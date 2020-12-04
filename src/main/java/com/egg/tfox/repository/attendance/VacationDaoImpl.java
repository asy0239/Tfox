package com.egg.tfox.repository.attendance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.entity.attendance.VacationRequest;

@Repository
public class VacationDaoImpl implements VacationDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Vacation> selectAll() {
		List<Vacation> list = sqlSession.selectList("vacation.allList");
		return list;
	}

	@Override
	public int reqDay(String id) {
		//사원 입사일 입사년도 가지고옴
		String reqday = sqlSession.selectOne("vacation.reqDay", id);
		//입사년도로 연차일수 가지고옴
		String vacReq = sqlSession.selectOne("vacation.vacReq", reqday);
		
		//리스트에 연차Y로 된 승인된 휴가만 가지고옴 날짜
		List<Integer> ot = sqlSession.selectList("vacation.addreqDay", id);

		//아래에서 ot에 들어있는값을 더한다.
		int sum = 0;
		if (ot != null) {
			for (int i = 0; i < ot.size(); i++) {
				sum = sum + ot.get(i);
				System.out.println(sum);
			}
		}else {
			return Integer.parseInt(vacReq);
		}
		int result = Integer.parseInt(vacReq) - sum;
		return result;
	}

	@Override
	public String deptname(String id) {
		//휴가 신청부분 이름 가지고오기
		String deptname = sqlSession.selectOne("vacation.deptname", id);
		return deptname;
	}

	@Override
	public List<String> vacCategory() {
		//카테고리 리스트 가지고오기
		List<String> category = sqlSession.selectList("vacation.category");
		return category;
	}


	@Override
	public void vacInsert(VacationRequest vacRequest) {
		String catetype = sqlSession.selectOne("vacation.catetype", vacRequest);
		vacRequest.setVactype_id(catetype);
		sqlSession.selectOne("vacation.vacinsert",vacRequest);
	}

	

}
