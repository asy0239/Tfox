package com.egg.tfox.service.attendance;

import java.util.HashMap;
import java.util.List;

import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.entity.attendance.VacationRequest;
import com.egg.tfox.entity.attendance.VacationSet;

public interface VacationService {

	public List<Vacation> selectList();

	public int reqday(String id);

	public String deptname(String id);

	public List<String> vacCategory();

	public void vacInsert(VacationRequest vacRequest);

	public HashMap<String, Object> vacDayList(String id);

	public List<String> vacSearchDay(List<String> category, String id);

	public List<Vacation> myVacList(String id);

	public List<VacationSet> onoff();

	public void vacOnOffUpdate(String vacOnOff);

	public List<VacationSet> vcsday();

	public List<VacationSet> vacCate();


}
