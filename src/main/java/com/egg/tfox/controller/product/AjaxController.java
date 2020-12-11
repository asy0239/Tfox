package com.egg.tfox.controller.product;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.egg.tfox.entity.Manuf;
import com.egg.tfox.entity.Supplier;


@Controller
public class AjaxController {
	
	
	@Autowired
	SqlSession sqlSession;

	@PostMapping("product/manuf")
	@ResponseBody
	public Object manufAjax(@RequestBody Manuf manuf) {
		HashMap<String, Object> map = new HashMap<String , Object>();
		map.put("name", manuf.getManu_name());
		int count = sqlSession.insert("manuf.add", manuf);
		System.out.println(count);
		return map;
	}

	
	   
	@PostMapping("/product/sup")
	@ResponseBody
	public Object supplyAjax(@RequestBody Supplier supplier) {
		HashMap<String , Object> map = new HashMap<String , Object>();
		map.put("name", supplier.getSup_name());
	
	

		
		int count = sqlSession.insert("sup.add" , supplier);
		System.out.println(count);
	 return map;
	}
	
	
}
