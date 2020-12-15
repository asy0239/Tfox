package com.egg.tfox.repository.attendance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.entity.attendance.PagingVO;
import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.entity.attendance.VacationMycalendar;
import com.egg.tfox.entity.attendance.VacationRequest;
import com.egg.tfox.entity.attendance.VacationSet;

@Repository
public class VacationDaoImpl implements VacationDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Vacation> selectAll(Map<String, Object>map, PagingVO pi) {
		Map<String, Object> list = new HashMap<>();
		list.put("search_cate", map.get("search_cate"));
		list.put("keyword", map.get("keyword"));
		list.put("start", pi.getStart());
		list.put("end", pi.getEnd());
		
		
		return sqlSession.selectList("vacation.allList", list);
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
		//카테고리에서 사용중(Y)인것 리스트 가지고오기
		List<String> category = sqlSession.selectList("vacation.category");
		return category;
	}
	
	@Override
	public List<String> vacCategoryAll() {
		//카테고리 모든 리스트 가지고오기
		List<String> category = sqlSession.selectList("vacation.categoryAll");
		return category;
	}


	@Override
	public void vacInsert(VacationRequest vacRequest) {
		//휴가 신청폼
		String catetype = sqlSession.selectOne("vacation.catetype", vacRequest);
		vacRequest.setVactype_id(catetype);
		sqlSession.insert("vacation.vacinsert",vacRequest);
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
			}
		}else {
			map.put("yearDay", sum);
		}
		
		if (allt != null) {
			for (int i = 0; i < allt.size(); i++) {
				sum1 = sum1 + allt.get(i);
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
	  //날짜계산 
		Map<String, Object> map = new HashMap<>();
		String sum;
		List<String> result = new ArrayList<>();
		map.put("id", id);
		//카테고리를 가지고와서 크기만큼 반복문 돌림
		//일자를 가지고오는것인데, 리스트는 순차적임.
		//null값인경우 0을 추가한다 
		for(int i = 0; i<category.size(); i++) {
			map.put("category", category.get(i));
			sum = sqlSession.selectOne("vacation.ctday", map);
			map.remove("category");
			if(sum == null) {
				sum = "0";
				result.add(sum);
			}else {
				result.add(sum);
			}
		}		

		return result;
	}

	@Override
	public List<Vacation> myVacList(String id) {
		//내 휴가리스트
		List<Vacation> list = sqlSession.selectList("vacation.myList", id);
		return list;
	}

	@Override
	public List<VacationSet> onoff() {
		// 휴가 설정 가지고오는것 (초기 불러올떄)
		List<VacationSet> list = sqlSession.selectList("vacation.loadOnOff");
		return list;
	}

	@Override
	public void vacOnOffUpdate(String vacOnOff) {
		//휴가 사용 ON OFF
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
		//카테고리 이름 가지고오는 구문
		List<VacationSet> list = sqlSession.selectList("vacation.setVacCate");
		return list;
	}

	@Override
	public List<Vacation> detailList(String vacapl_id) {
		List<Vacation> list = sqlSession.selectList("vacation.detailList", vacapl_id);
		return list;
	}

	@Override
	public int countBoard(Map<String, Object> map) {
		return sqlSession.selectOne("vacation.countBoard", map);
	}
 
	@Override
	public void vacAcceptY(String y) {
		sqlSession.update("vacation.acceptY", y);
	}

	@Override
	public void vacAcceptN(String n) {
		sqlSession.update("vacation.acceptN", n);
	}

	@Override
	public void vacDaySet(List<String> vc_date, List<String> year_id) {
		Map<String, Object> list = new HashMap<>();
		//왜 내부 foreach문이 안먹을까...
		for(int i=0; i<vc_date.size(); i++) {
			list.put("yearid", year_id.get(i));
			list.put("vcdate", vc_date.get(i));
			sqlSession.update("vacation.vacDaySet", list);
			list.remove("yearid");
			list.remove("vcdate");
		}
	}

	@Override
	public void vacCateSet(List<String> vactypeName, List<String> vactypeYN, List<String> yearYN) {
		// 한 줄에 하나씩이라서 size로 반복문 돌리는것 가능한것.
	
		
		Map<String, Object> list =new HashMap<>();
		for(int i=0; i<vactypeName.size(); i++) {
			list.put("vactypeName", vactypeName.get(i));
			list.put("vactypeYN", vactypeYN.get(i));
			list.put("yearYN", yearYN.get(i));
			sqlSession.update("vacation.vacCateSet", list);
			list.remove("vactypeName");
			list.remove("vactypeYN");
			list.remove("yearYN");
		}
			
	}

	@Override
	public void vacCateDelete(String name) {
		sqlSession.delete("vacation.catDelete", name);
	}

	@Override
	public List<VacationMycalendar> myVacCalendar(String id) {
		return sqlSession.selectList("vacation.myVacCalander", id);
	}

		

	

}
