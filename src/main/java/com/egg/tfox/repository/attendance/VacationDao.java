package com.egg.tfox.repository.attendance;

import java.util.List;

import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.entity.attendance.VacationRequest;

public interface VacationDao {

	List<Vacation> selectAll();

	int reqDay(String id);

	String deptname(String id);

	List<String> vacCategory();

	void vacInsert(VacationRequest vacRequest);


}
