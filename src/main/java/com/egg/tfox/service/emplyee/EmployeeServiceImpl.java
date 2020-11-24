package com.egg.tfox.service.emplyee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egg.tfox.entity.Employee;
import com.egg.tfox.repository.employee.EmployeeDao;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	EmployeeDao employeeDao;
	
	@Override
	public Employee selectById(String username) {
		return employeeDao.selectById(username);
	}

}
