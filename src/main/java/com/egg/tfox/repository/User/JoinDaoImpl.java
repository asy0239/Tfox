package com.egg.tfox.repository.User;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.egg.tfox.entity.User;


@Repository
public class JoinDaoImpl implements JoinDao {
	@Autowired
    private SqlSession sqlSession;
	@Autowired
	PasswordEncoder encoder;
	// 회원가입
	@Override
	public void userJoin(User user) {
		//암호화
		String encryPass = encoder.encode(user.getUser_pwd());
		user.setUser_pwd(encryPass);
		
		sqlSession.insert("User.userJoin", user);
	}
	// 아이디 체크
	@Override
	public String checkId(String inputId) {
		String checkResult = sqlSession.selectOne("User.checkId",inputId);
		return checkResult;
	}
}
