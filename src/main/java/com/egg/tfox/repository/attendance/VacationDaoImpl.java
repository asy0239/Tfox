package com.egg.tfox.repository.attendance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.entity.attendance.Vacation;

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
		//
		int reqday = sqlSession.selectOne("vacation.reqDay", id);
		System.out.println(reqday);
		int vacReq = sqlSession.selectOne("vacation.vacReq", reqday);
		System.out.println(vacReq);
		List<Integer> ot = sqlSession.selectList("vacation.addreqDay", id);

		int sum = 0;
		if (ot != null) {
			for (int i = 0; i < ot.size(); i++) {
				sum = sum + ot.get(i);
				System.out.println(sum);
			}
		}else {
			return vacReq;
		}
		int result = vacReq - sum;
		System.out.println("남은 휴가" + result);
		return result;
	}
}
