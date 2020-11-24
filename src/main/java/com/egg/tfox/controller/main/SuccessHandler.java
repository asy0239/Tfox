package com.egg.tfox.controller.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.egg.tfox.entity.Employee;
import com.egg.tfox.service.emplyee.EmployeeService;


import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SuccessHandler implements AuthenticationSuccessHandler {
	@Autowired
	EmployeeService employService;
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("Success");
		List<String> roleNames = new ArrayList<>();
		
		authentication.getAuthorities().forEach(auth -> {
			roleNames.add(auth.getAuthority());
		});
		UserDetails ud = (UserDetails) authentication.getPrincipal();
		
		Employee employee = employService.selectById(ud.getUsername());
		
		log.info("selectMember : {}", employee);
		 if (roleNames.contains("ROLE_ADMIN")){
			 request.getSession().setAttribute("loginEmp", employee);
			response.sendRedirect(request.getContextPath() + "/mainView");
			return;
		}
		return; 
	}
}
