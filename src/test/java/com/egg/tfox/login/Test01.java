package com.egg.tfox.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class Test01 {
	@Autowired
	PasswordEncoder encoder;

	@Autowired
	DataSource ds;

	 @Test
	public void test() {
		log.info("{}", encoder);
		log.info("{}", ds);
	}

	//@Test
	public void test2() {
		Connection con = null;
		PreparedStatement pstmt = null;

		String query = "update employee set emp_password=? where emp_loginid=?";

		for (int j = 1; j <= 6; j++) {
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(query);

				// pstmt.setString(1, "epass" + 01);
				pstmt.setString(1, encoder.encode("epass" + 0 + j));
				pstmt.setString(2, "euser" + 0 + j);

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

			for (int i = 1; i <= 6; i++) {
				try {
					con = ds.getConnection();
					pstmt = con.prepareStatement(query);

					// pstmt.setString(1, "epass" + 01);
					pstmt.setString(1, encoder.encode("bpass" + 0 + i));
					pstmt.setString(2, "buser" + 0 + i);

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
			for (int k = 1; k <= 6; k++) {
				try {
					con = ds.getConnection();
					pstmt = con.prepareStatement(query);

					// pstmt.setString(1, "epass" + 01);
					pstmt.setString(1, encoder.encode("mpass" + 0 + k));
					pstmt.setString(2, "muser" + 0 + k);

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
