package com.egg.tfox.repository.attendance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.entity.attendance.AttendanceEdit;
import com.egg.tfox.entity.attendance.AttendanceMain;
import com.egg.tfox.entity.attendance.AttendanceSet;
import com.egg.tfox.entity.attendance.Calendar;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<AttendanceMain> worktime(String id) {
		return sqlSession.selectList("attendance.worktime", id);
	}

	@Override
	public void workinsertTime(String id) {
		sqlSession.insert("attendance.workcalinsert", id);
		sqlSession.insert("attendance.workinsert", id);
	}

	@Override
	public List<AttendanceMain> starttime(String id) {
		return sqlSession.selectList("attendance.starttime", id);
	}

	@Override
	public void workendTime(String attid, String id) {
		sqlSession.update("attendance.workendTime", attid);
		sqlSession.insert("attendance.workcalendinsert", id);
	}

	@Override
	public List<Calendar> calenList(String id) {
		return sqlSession.selectList("attendance.calenList",id);
	}

	@Override
	public List<AttendanceEdit> attdYNlist() {
		return sqlSession.selectList("attendance.attdYNlist");
	}

	@Override
	public List<AttendanceSet> attdSetlist() {
		return sqlSession.selectList("attendance.attdSetlist");
	}

	@Override
	public void atdOnOff(Map<String, Object> map) {
		sqlSession.update("attendance.atdOnOff",map);
	}

	@Override
	public void timedaySet(List<String> list, List<String> start_time, List<String> endtime) {
		Map<String, Object> map = new HashMap<>();
		
		for(int i =0; i<list.size(); i++) {
			map.put("yn", list.get(i));
			map.put("setid", "AD00"+i);
			map.put("start",start_time.get(i));
			map.put("end", endtime.get(i));
			sqlSession.update("attendance.timedaySet",map);
			map.clear();
		}
		
	}

	@Override
	public List<AttendanceSet> attdWorkTimelist() {
		return sqlSession.selectList("attendance.worktimelist");
	} 
	
	
}
