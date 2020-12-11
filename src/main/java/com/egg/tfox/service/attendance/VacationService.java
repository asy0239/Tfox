package com.egg.tfox.service.attendance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.egg.tfox.entity.attendance.PagingVO;
import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.entity.attendance.VacationRequest;
import com.egg.tfox.entity.attendance.VacationSet;

public interface VacationService {

	public List<Vacation> selectList(Map<String, Object> map, PagingVO pi);

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

	public List<Vacation> detailList(String vacapl_id);

	public int countBoard(Map<String, Object> map);

	public void vacAcceptY(String y);

	public void vacAcceptN(String n);

	public List<String> vacCategoryAll();

	public void vacDaySet(List<String> vc_date, List<String> year_id);

	public void vacCateSet(List<String> vactypeName, List<String> vactypeYN, List<String> yearYN);

	public void vacCateDelete(String name);



}
