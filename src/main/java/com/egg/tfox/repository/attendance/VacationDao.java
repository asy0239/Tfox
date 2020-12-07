package com.egg.tfox.repository.attendance;

import java.util.HashMap;
import java.util.List;

import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.entity.attendance.VacationRequest;
import com.egg.tfox.entity.attendance.VacationSet;

public interface VacationDao {

	List<Vacation> selectAll();

	int reqDay(String id);

	String deptname(String id);

	List<String> vacCategory();

	void vacInsert(VacationRequest vacRequest);

	HashMap<String, Object> vacDaylist(String id);

	List<String> vacSearchDay(List<String> category, String id);

	List<Vacation> myVacList(String id);

	List<VacationSet> onoff();

	void vacOnOffUpdate(String vacOnOff);

	List<VacationSet> vcsday();

	List<VacationSet> vacCate();



}
