package com.egg.tfox.service.attendance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.attendance.PagingVO;
import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.entity.attendance.VacationRequest;
import com.egg.tfox.entity.attendance.VacationSet;
import com.egg.tfox.repository.attendance.VacationDao;

@Service
public class VacationServiceImpl implements VacationService {
	@Autowired
	private VacationDao vacationDao;

	@Override
	public List<Vacation> selectList(Map<String, Object> map, PagingVO pi) {
		return vacationDao.selectAll(map, pi);
	}

	@Override
	public int reqday(String id) {
		return vacationDao.reqDay(id);
	}

	@Override
	public String deptname(String id) {
		return vacationDao.deptname(id);
	}

	@Override
	public List<String> vacCategory() {
		return vacationDao.vacCategory();
	}
	
	@Override
	public List<String> vacCategoryAll() {
		return vacationDao.vacCategoryAll();
	}

	

	@Override
	public void vacInsert(VacationRequest vacRequest) {
		// TODO Auto-generated method stub
		 vacationDao.vacInsert(vacRequest);
	}

	@Override
	public HashMap<String, Object> vacDayList(String id) {
		return vacationDao.vacDaylist(id);
	}

	@Override
	public List<String> vacSearchDay(List<String> category, String id) {
		return vacationDao.vacSearchDay(category, id);
	}

	@Override
	public List<Vacation> myVacList(String id) {
		return vacationDao.myVacList(id);
	}

	@Override
	public List<VacationSet> onoff() {
		return vacationDao.onoff();
	}

	@Override
	public void vacOnOffUpdate(String vacOnOff) {
		vacationDao.vacOnOffUpdate(vacOnOff);
		
	}

	@Override
	public List<VacationSet> vcsday() {
		return vacationDao.vcsday();
	}

	@Override
	public List<VacationSet> vacCate() {
		return vacationDao.vacCate();
	}

	@Override
	public List<Vacation> detailList(String vacapl_id) {
		return vacationDao.detailList(vacapl_id);
	}

	@Override
	public int countBoard(Map<String, Object> map) {
		return vacationDao.countBoard(map);
	}

	@Override
	public void vacAcceptY(String y) {
		vacationDao.vacAcceptY(y);
	}

	@Override
	public void vacAcceptN(String n) {
		vacationDao.vacAcceptN(n);
	}

	@Override
	public void vacDaySet(List<String> vc_date, List<String> year_id) {
		vacationDao.vacDaySet(vc_date, year_id);
	}

	@Override
	public void vacCateSet(List<String> vactypeName, List<String> vactypeYN, List<String> yearYN) {
		vacationDao.vacCateSet(vactypeName, vactypeYN, yearYN);
	}

	


		
	
	
}
