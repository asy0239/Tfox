package com.egg.tfox.service.attendance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.attendance.Vacation;
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
	
}
