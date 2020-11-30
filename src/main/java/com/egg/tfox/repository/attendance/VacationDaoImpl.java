package com.egg.tfox.repository.attendance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.egg.tfox.entity.attendance.Vacation;

public class VacationDaoImpl implements VacationDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Vacation> selectAll() {
		List<Vacation> list = sqlSession.selectList("vacation.allList");
		return sqlSession.selectList("vacation.allList");
	} 
}
