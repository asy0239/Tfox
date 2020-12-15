package com.egg.tfox.service.attendance;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.attendance.AttendanceEdit;
import com.egg.tfox.entity.attendance.AttendanceMain;
import com.egg.tfox.entity.attendance.AttendanceSet;
import com.egg.tfox.entity.attendance.Calendar;
import com.egg.tfox.repository.attendance.AttendanceDao;


@Service
public class AttendanceServiceImpl implements AttendanceService {
	@Autowired
	private AttendanceDao attendancedao;
	@Override
	public List<AttendanceMain> worktime(String id) {
		return attendancedao.worktime(id);
	}
	@Override
	public void workinsertTime(String id) {
		attendancedao.workinsertTime(id);
	}
	@Override
	public List<AttendanceMain> starttime(String id) {
		return attendancedao.starttime(id);
	}
	@Override
	public void workendTime(String attid, String id) {
		attendancedao.workendTime(attid, id);
	}
	@Override
	public List<Calendar> calenList(String id) {
		return attendancedao.calenList(id);
	}
	@Override
	public List<AttendanceEdit> attdYNlist() {
		return attendancedao.attdYNlist();
	}
	@Override
	public List<AttendanceSet> attdSetlist() {
		return attendancedao.attdSetlist();
	}
	@Override
	public void atdOnOff(Map<String, Object> map) {
		attendancedao.atdOnOff(map);
	}
	@Override
	public void timedaySet(List<String> list, List<String> start_time, List<String> endtime) {
		attendancedao.timedaySet(list, start_time, endtime);
	}
	@Override
	public List<AttendanceSet> attdWorkTimelist() {
		return attendancedao.attdWorkTimelist();
	}


}
	