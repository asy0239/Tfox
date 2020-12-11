package com.egg.tfox.repository.attendance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.egg.tfox.entity.attendance.PagingVO;
import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.entity.attendance.VacationRequest;
import com.egg.tfox.entity.attendance.VacationSet;

public interface VacationDao {

	List<Vacation> selectAll(Map<String, Object> map, PagingVO pi);

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

	List<Vacation> detailList(String vacapl_id);

	int countBoard(Map<String, Object> map);

	void vacAcceptY(String y);

	void vacAcceptN(String n);

	List<String> vacCategoryAll();

	void vacDaySet(List<String> vc_date, List<String> year_id);

	void vacCateSet(List<String> vactypeName, List<String> vactypeYN, List<String> yearYN);

	void vacCateDelete(String name);





}
