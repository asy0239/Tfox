package com.egg.tfox.repository.attendance;

import java.util.List;

import com.egg.tfox.entity.attendance.Vacation;

public interface VacationDao {

	List<Vacation> selectAll();


}
