package com.egg.tfox.repository.User;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.entity.User;

@Repository
public class userListDaoImpl implements userListDao{
@Autowired
 private SqlSession sqlSession;

@Override
public List<User> userlist() {
	return sqlSession.selectList("UserList.userList");
}
}
