package com.egg.tfox.repository.attendance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.entity.attendance.VacationMy;
import com.egg.tfox.entity.attendance.VacationRequest;
import com.egg.tfox.entity.attendance.VacationSet;

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

		//아래에서 ot에 들어있는값을 더한다. sql에서 내부처리로해도됨.
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

	@Override
	public HashMap<String, Object> vacDaylist(String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//사원 입사일 입사년도 가지고옴
		String reqday = sqlSession.selectOne("vacation.reqDay", id);
		//입사년도로 연차일수 가지고옴
		String vacReq = sqlSession.selectOne("vacation.vacReq", reqday);
		
		
		//리스트에 연차Y로 된 승인된 휴가만 가지고옴 날짜
		List<Integer> ot = sqlSession.selectList("vacation.addreqDay", id);
		List<Integer> allt = sqlSession.selectList("vacation.AllreqDay", id);
		//아래에서 ot에 들어있는값을 더한다.
		int sum = 0;
		int sum1 = 0;
		if (ot != null) {
			for (int i = 0; i < ot.size(); i++) {
				sum = sum + ot.get(i);
				System.out.println(sum);
			}
		}else {
			map.put("yearDay", sum);
		}
		
		if (allt != null) {
			for (int i = 0; i < allt.size(); i++) {
				sum1 = sum1 + allt.get(i);
				System.out.println(sum1);
			}
		}else {
			map.put("allDay", sum1);
		}
		
		int leftday = Integer.parseInt(vacReq) - sum;
		
		map.put("YearAllday", vacReq);
		map.put("leftday", leftday);
		map.put("yearDay",sum);
		map.put("allDay",sum1);
		return map;
	}

	@Override
	public List<String> vacSearchDay(List<String> category, String id) {
	
		Map<String, Object> map = new HashMap<>();
		String sum;
		List<String> result = new ArrayList<>();
		map.put("id", id);
		//카테고리를 가지고와서 크기만큼 반복문 돌림
		//일자를 가지고오는것인데, 리스트는 순차적임.
		//null값인경우 0을 추가한다 
		for(int i = 0; i<category.size(); i++) {
			map.put("category", category.get(i));
			System.out.println(category.get(i));
			sum = sqlSession.selectOne("vacation.ctday", map);
			map.remove("category");
			if(sum == null) {
				sum = "0";
				result.add(sum);
			}else {
				result.add(sum);
			}
			System.out.println("sum" + sum);
		}		

		return result;
	}

	@Override
	public List<Vacation> myVacList(String id) {
		List<Vacation> list = sqlSession.selectList("vacation.myList", id);
		return list;
	}

	@Override
	public List<VacationSet> onoff() {
		List<VacationSet> list = sqlSession.selectList("vacation.loadOnOff");
		return list;
	}

	@Override
	public void vacOnOffUpdate(String vacOnOff) {
		sqlSession.selectOne("vacation.vacOnOff", vacOnOff);
	}

	@Override
	public List<VacationSet> vcsday() {
		//1~30년일자 가지고오기
		List<VacationSet> list = sqlSession.selectList("vacation.vcsday");
		return list;
	}

	@Override
	public List<VacationSet> vacCate() {
		List<VacationSet> list = sqlSession.selectList("vacation.setVacCate");
		return list;
	}

	

}
