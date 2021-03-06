package com.egg.tfox.repository.attendance;

import java.util.List;
import java.util.Map;

import com.egg.tfox.entity.attendance.AttendanceEdit;
import com.egg.tfox.entity.attendance.AttendanceMain;
import com.egg.tfox.entity.attendance.AttendanceSet;
import com.egg.tfox.entity.attendance.Calendar;

public interface AttendanceDao {

	List<AttendanceMain> worktime(String id);

	void workinsertTime(String id);

	List<AttendanceMain> starttime(String id);

	void workendTime(String attid, String id);

	List<Calendar> calenList(String id);

	List<AttendanceEdit> attdYNlist();

	List<AttendanceSet> attdSetlist();

	void atdOnOff(Map<String, Object> map);

	void timedaySet(List<String> list, List<String> start_time, List<String> endtime);

	List<AttendanceSet> attdWorkTimelist();

}
