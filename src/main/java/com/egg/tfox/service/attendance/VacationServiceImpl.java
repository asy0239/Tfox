package com.egg.tfox.service.attendance;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.entity.attendance.VacationRequest;
import com.egg.tfox.entity.attendance.VacationSet;
import com.egg.tfox.repository.attendance.VacationDao;

@Service
public class VacationServiceImpl implements VacationService {
	@Autowired
	private VacationDao vacationDao;

	@Override
	public List<Vacation> selectList() {
		return vacationDao.selectAll();
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


		
	
	
}
