package com.egg.tfox.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.egg.tfox.service.board.BoardService;
import com.egg.tfox.vo.board.GesiVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;

	@GetMapping("/board/gesimul")
	public String gesimul(){
		return "board/gesimul";
	}
	
	@RequestMapping (value="/board/gesiS.do", method = RequestMethod.GET)
	public String gesimulList(@RequestParam String gesi_code, 
								HttpServletRequest req, Model model) {
		/*
		 * List<GesiVO> gesiList; if(gesi_code.equals("1")) { gesiList =
		 * service.selectList(); model.addAttribute("gesiList", gesiList);
		 * 
		 * }
		 */
		
		
		
		return "board/gesimul";
	}

}
