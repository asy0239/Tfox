package com.egg.tfox.service.attendance;

import java.util.List;

import com.egg.tfox.entity.attendance.Vacation;

public interface VacationService {

	public List<Vacation> selectList();

	public int reqday(String id);

}
