package com.egg.tfox.repository.employee;

import com.egg.tfox.entity.Employee;

public interface EmployeeDao {
		
	 Employee selectById(String username);
}
