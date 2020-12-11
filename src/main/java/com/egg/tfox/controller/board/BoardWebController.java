package com.egg.tfox.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.egg.tfox.service.board.QnaService;
import com.egg.tfox.vo.board.QnaType;

@Controller
public class BoardWebController {
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/webFront/header")
	public String header() {
		return "webFront/header";
	}

	@GetMapping("/webFront/slide")
	public String slide() {
		return "webFront/slide";
	}
	
	
	
	@GetMapping("/webFront/main")
	public String main() {
		return "webFront/main";
	}
	@GetMapping("/webFront/center")
	public String center() {
		return "webFront/center";
	}
	
	@GetMapping("/webFront/QnaInsert")
	public String qnainsert(Model model) {
		
		List<QnaType> qnatype; 
		qnatype = qnaService.select();
		
		model.addAttribute("qnaType", qnatype);
		
		return "webFront/QnaInsert";
	}
	
	@RequestMapping (value="/webFront/qna.add", method = RequestMethod.GET)
	public String qnaadd(
							Model model,
							@RequestParam String user_name,
							@RequestParam String gesi_title,
							@RequestParam String qnatype,
							@RequestParam String user_id
							) {
		
		System.out.println();
		
		return "webFront/center";
	}
	
	
	@GetMapping("/webFront/hood-item")
	public String hoodItem(){
		return "webFront/hood-item";
	}
	@GetMapping("/board/gesipan")
	public String gesipan(){
		return "board/gesipan";
	}
	
	
	
}
