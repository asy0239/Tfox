package com.egg.tfox.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class test {
	@Autowired
	PasswordEncoder encoder;
	
	@Autowired
	DataSource ds;
	
	@Test
	public void test()
	{
		log.info("{}", encoder);
		log.info("{}", ds);
	}
	
//	@Test
	public void test2() {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String query = "update employee set emp_password=? where emp_loginid=?";
		
		for (int j = 1; j <= 10; j++) {
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(query);
				
//				pstmt.setString(1, "test" + j);
				pstmt.setString(1, encoder.encode("test" + j));
				pstmt.setString(2, "test" + j);
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					pstmt.close();
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
