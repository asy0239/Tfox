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
import com.egg.tfox.service.board.QnaService;
import com.egg.tfox.vo.board.GesiType;
import com.egg.tfox.vo.board.GesiVO;
import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.QnaListVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private QnaService qnaService;

	@GetMapping("/board/gesimul")
	public String gesimul(){
		return "board/gesimul";
	}
	
	@GetMapping("/board/gesipan")
	public String gesipan(Model model){
		
		 List<GesiType> gesipanList; gesipanList = boardService.gesipanList();
		System.out.println("pan" +gesipanList);
		 model.addAttribute("pan", gesipanList);
		return "board/gesipan";
	}
	@GetMapping("/board/gesipan2")
	public String gesipan(@RequestParam String gesi_code, Model model){
		
		 
		return "board/gesipan2";
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
		
		int total = boardService.countBoard(mapList);
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
	
		  List<GesiVO> gesiList; gesiList = boardService.selectList(mapList, pi);
		  model.addAttribute("reqList", mapList);
		  model.addAttribute("gesiList", gesiList);
		  model.addAttribute("paging", pi);
		  
		  System.out.println(gesiList);

		return "board/gesimul";
	}

	@RequestMapping(value="/gesi.web", method = RequestMethod.GET)
	public String gesiWebList(@RequestParam String gesi_code,
							  @RequestParam(value="nowPage", required=false)String nowPage, 
							  @RequestParam(value="cntPerPage", required=false)String cntPerPage, 
								HttpServletRequest req, Model model, PageInfo pi) {
		System.out.println(gesi_code);
		
		String webURL = null;
		
		if(gesi_code.equals("GS001")) {
			
			int total = qnaService.countQna(gesi_code);
			
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "10";
			}
			
			pi = new PageInfo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
			List<QnaListVO> gesiWebList = qnaService.selectQnaList(gesi_code, pi);
			
			model.addAttribute("qnaList", gesiWebList);
			model.addAttribute("paging", pi);
			System.out.println(gesiWebList);
			
			webURL="webFront/center";
		}else if(gesi_code.equals("GS002")) {
			webURL="webFront/review";
		}
		
		return webURL;
	}
	
	@RequestMapping(value="/gesi.web2", method = RequestMethod.GET)
	public String gesiWebList(@RequestParam String gesi_id,
							  @RequestParam String gesi_code,
								HttpServletRequest req, Model model, PageInfo pi) {
		System.out.println(gesi_code);
		
		String webURL = null;
		
		if(gesi_code.equals("GS001")) {
			
			List<QnaListVO> gesiDetail = qnaService.detailList(gesi_id);
			
			Map<String, Object> detail = new HashMap<>();
			detail.put("gesi_name", gesiDetail.get(0).getGesi_name());
			detail.put("gesi_id", gesiDetail.get(0).getGesi_id());
			detail.put("gesi_title", gesiDetail.get(0).getGesi_title());
			detail.put("gesi_content", gesiDetail.get(0).getGesi_content());
			detail.put("gesi_date", gesiDetail.get(0).getGesi_date());
			detail.put("gesi_status", gesiDetail.get(0).getGesi_status());
			detail.put("gesi_ansdate", gesiDetail.get(0).getGesi_ansdate());
			detail.put("gesi_anscontent", gesiDetail.get(0).getGesi_anscontent());
			detail.put("user_id", gesiDetail.get(0).getUser_id());
			detail.put("user_name", gesiDetail.get(0).getUser_name());
			detail.put("gesi_code", gesiDetail.get(0).getGesi_code());
			detail.put("qna_name", gesiDetail.get(0).getQna_name());

			model.addAttribute("detail",detail);
			webURL="webFront/QnaDetail";
		}else if(gesi_code.equals("GS002")) {
			webURL="webFront/review";
		}
		
		return webURL;
	}
	
	@RequestMapping(value="/board/deleteGesi", method = RequestMethod.GET)
	public String gesiDelete(
						@RequestParam List<String> gesi_id
													) {
		System.out.println(gesi_id);
		int qnaDel  = qnaService.countDelQna(gesi_id);
		System.out.println(gesi_id);
		
		if(qnaDel == 1) {
			int gesiDel =  qnaService.gesiDel(gesi_id);
			
		}
		
		return "board/gesimul";
		
		
	}
	
}
