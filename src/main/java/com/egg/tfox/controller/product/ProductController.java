package com.egg.tfox.controller.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.egg.tfox.entity.Manuf;
import com.egg.tfox.entity.Supplier;

@Controller
public class ProductController {
	
	@Autowired
	SqlSession sqlSession;
	
	@GetMapping("/product/insert")	
	public String prduct( Model model) {
	
		
		List<Manuf> list = sqlSession.selectList("manuf.list");
		List<Supplier> supList = sqlSession.selectList("sup.supList");
		model.addAttribute("list" , list);
		
		model.addAttribute("sup", supList);

		return "/product/insert";
	}
	@PostMapping("/product/insert")
	public String product() {
		System.out.println("성공");
		
		return "redirect:/product/insert_finish";
	}
	
	@GetMapping("/product/insert_finish")
	public String insertFinish(
			) {
		
		return "/product/productList";
	}
	
	
		
	 
}
