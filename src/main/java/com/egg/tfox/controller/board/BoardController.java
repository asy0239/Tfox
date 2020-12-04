package com.egg.tfox.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.egg.tfox.vo.board.PageInfo;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;

	@GetMapping("/board/gesimul")
	public String gesimul(){
		return "board/gesimul";
	}
	
	@RequestMapping (value="/board/gesiS.do", method = RequestMethod.GET)
	public String gesimulList(
								@RequestParam String searchDate,
								@RequestParam String searchDate2,
								@RequestParam String gesi_code,
								@RequestParam String searchType,
								@RequestParam String typeKeyword,
								@RequestParam(value="nowPage", required=false)String nowPage, 
								@RequestParam(value="cntPerPage", required=false)String cntPerPage, 
								HttpServletRequest req, Model model, PageInfo pi) {	
		
		Map<String, Object> mapList = new HashMap<>();
		mapList.put("startD", searchDate);
		mapList.put("endD", searchDate2);
		mapList.put("gesi_code", gesi_code);
		mapList.put("searchType", searchType);
		mapList.put("keyword", typeKeyword);
		
		int total = service.countBoard(mapList);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		pi = new PageInfo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		System.out.println(mapList);
		
		
	
		  List<GesiVO> gesiList; gesiList = service.selectList(mapList, pi);
		  model.addAttribute("gesiList", gesiList);
		  model.addAttribute("paging", pi);
		  
		  System.out.println(gesiList);
		 

		return "board/gesimul";
	}

	@RequestMapping(value="/gesi.web", method = RequestMethod.GET)
	public String gesiWebList(@RequestParam String gesi_code, 
								HttpServletRequest req, Model model) {
		System.out.println(gesi_code);
		
		String webURL = null;
		List gesiWebList;
		
		if(gesi_code.equals("GS001")) {
			gesiWebList = service.selectQnaList(gesi_code);
			webURL="webFront/center";
		}else if(gesi_code.equals("GS002")) {
			
			webURL="webFront/center";
		}
		
		return webURL;
	}
}
