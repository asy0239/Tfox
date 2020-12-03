package com.egg.tfox.repository.attendance;

import java.util.List;

import com.egg.tfox.entity.attendance.Vacation;

public interface VacationDao {

	List<Vacation> selectAll();

	int reqDay(String id);

	String deptname(String id);

	List<String> vacCategory();


}
