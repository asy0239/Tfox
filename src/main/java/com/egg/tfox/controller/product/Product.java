package com.egg.tfox.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Product {
	@GetMapping("/product/insert")
	public String prduct() {

		return "/product/insert";
	}

	
	
		@PostMapping("/product/insert")
	  @ResponseBody 
	  String addManu(String name, String CEO) {
	  
	  return name+CEO; }
	 
}
