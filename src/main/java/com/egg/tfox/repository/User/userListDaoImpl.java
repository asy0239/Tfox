package com.egg.tfox.repository.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.entity.User;
//import com.egg.tfox.entity.User;
import com.egg.tfox.vo.user.PaginInfo;
import com.egg.tfox.vo.user.UserVo;

@Repository
public class userListDaoImpl implements userListDao{
@Autowired
 private SqlSession sqlSession;

/*
@Override
  public List<User> userlist() { return
  sqlSession.selectList("UserList.userList"); }
 */

@Override
public List<UserVo> userlist(Map<String, Object> maplist, PaginInfo pi) {
	Map<String, Object> userlist = new HashMap<>();
	userlist.put("user_id", maplist.get("user_id"));
	userlist.put("user_name", maplist.get("user_name"));
	userlist.put("user_loginid", maplist.get("user_loginid"));
	userlist.put("user_date", maplist.get("user_date"));
	userlist.put("user_phone", maplist.get("user_phone"));
	userlist.put("user_email", maplist.get("user_email"));
	userlist.put("start", pi.getStart());
	userlist.put("end", pi.getEnd());
	return sqlSession.selectList("UserList.userlist", userlist);
}

@Override
public int countUser(Map<String, Object> maplist) {
	
	return sqlSession.selectOne("UserList.countUser", maplist);
}

@Override
public List<User> getinfo() {
	
	return sqlSession.selectList("UserList.getinfo");
}
}
