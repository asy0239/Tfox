package com.egg.tfox.repository.employee;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.entity.Employee;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class EmployeeDaoImpl implements EmployeeDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Employee selectById(String username) {
		return sqlSession.selectOne("employee.selectOneMember", username);
	}
	
}
