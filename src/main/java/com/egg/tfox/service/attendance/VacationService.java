package com.egg.tfox.service.attendance;

import java.util.List;

import com.egg.tfox.entity.attendance.Vacation;
import com.egg.tfox.entity.attendance.VacationRequest;

public interface VacationService {

	public List<Vacation> selectList();

	public int reqday(String id);

	public String deptname(String id);

	public List<String> vacCategory();

	public void vacInsert(VacationRequest vacRequest);


}
