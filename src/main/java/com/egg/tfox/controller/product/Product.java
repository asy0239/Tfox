package com.egg.tfox.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class Product {
	@GetMapping("/product/insert")
	public String prduct() {
		return "/product/insert";
	}
}
