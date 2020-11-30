package com.egg.tfox.repository.User;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.egg.tfox.entity.User;


@Repository
public class DaoImpl implements Dao {
  private SqlSessionTemplate sqlSession;
  
  public DaoImpl() {}
  
  public void setSqlSession(SqlSessionTemplate sqlSession) {
	  this.sqlSession = sqlSession;
  }

//@Override
//public User login(User user) {
//	// TODO Auto-generated method stub
//	return null;
//}

@Override
public void userJoin(User join) {
	sqlSession.insert("user.join", join);
	
}
}
