package com.egg.tfox.appEdit;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.egg.tfox.repository.approval.ApprovalEditDao;
import com.egg.tfox.service.approval.ApprovalEditService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class EditTest {
	
	
	@Autowired
	private ApprovalEditDao app_Dao;
	
	@Test
	public void test() {
		List<String> list = new ArrayList<String>();
		list.add("E000002");
		list.add("E000001");
		list.add("E000005");
		list.add("E000004");
		
		log.info(list.toString());
		app_Dao.searchEmp_pos(list);
		
	}
}
