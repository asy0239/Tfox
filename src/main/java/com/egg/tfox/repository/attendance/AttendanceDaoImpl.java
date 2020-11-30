package com.egg.tfox.repository.attendance;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class AttendanceDaoImpl implements AttendanceDao {
	@Autowired
	private SqlSession sqlSession; 
}
