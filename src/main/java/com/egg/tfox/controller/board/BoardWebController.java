package com.egg.tfox.controller.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.egg.tfox.service.board.BoardService;
import com.egg.tfox.service.board.QnaService;
import com.egg.tfox.vo.board.CartVO;
import com.egg.tfox.vo.board.GesiType;
import com.egg.tfox.vo.board.GesiVO;
import com.egg.tfox.vo.board.PageInfo;
import com.egg.tfox.vo.board.ProductVO;
import com.egg.tfox.vo.board.QnaListVO;
import com.egg.tfox.vo.board.QnaType;

@Controller
public class BoardWebController {
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/webFront/header")
	public String header(Model model) {
		
		/*
		 * List<GesiType> gesipanList; gesipanList = boardService.gesipanList();
		 * System.out.println(gesipanList); model.addAttribute("pan", gesipanList);
		 */
		 return "webFront/header";
	}

	@GetMapping("/webFront/slide")
	public String slide() {
		return "webFront/slide";
	}
	 
	
	
	@GetMapping("/webFront/main")
	public String main(Model model) {
		
		//상품 목록
		List<ProductVO> productList;
		productList = boardService.productList();		
		model.addAttribute("productList", productList);
		
		System.out.println(productList);
		
	
		return "webFront/main";
	}
	
	@GetMapping("/webFront/fileList")
	public ResponseEntity<ByteArrayResource> fileList(@RequestParam String pro_id, HttpServletRequest request) throws IOException {
		
	
		 String filePath = request.getSession().getServletContext().getRealPath("/resources/img/product");
		 
		/* System.out.println(filePath); */
		
		
		ResponseEntity<ByteArrayResource> entity = boardService.fileList(pro_id, filePath);
	
		System.out.println(entity);
		
		return entity;
		
	}
	

	@GetMapping("/webFront/detail")
	public String productDetail(
			@RequestParam String pro_name,
			@RequestParam String pro_id,
			@RequestParam String pro_price,
			@RequestParam String pro_summary,			
			Model model) {
		
		System.out.println(pro_name);
		System.out.println(pro_id);
		
		Map<String, Object> productInfo = new HashMap<>();
		productInfo.put("pro_id", pro_id);
		productInfo.put("pro_name", pro_name);
		productInfo.put("pro_price", pro_price);
		productInfo.put("pro_summary", pro_summary);
		
		List<ProductVO> proSize; proSize = boardService.proSize(productInfo);
		List<ProductVO> proColor; proColor = boardService.proColor(productInfo);
		
		model.addAttribute("pro_name", pro_name);
		model.addAttribute("pro_id", pro_id);
		model.addAttribute("pro_price", pro_price);
		model.addAttribute("pro_summary", pro_summary);
		
		model.addAttribute("proSize", proSize);
		model.addAttribute("proColor", proColor);
		
		
		/*
		 * List<ProductVO> detailList; detailList = boardService.detailList(pro_name);
		 * 
		 * model.addAttribute("detail", detailList);
		 */
		return "/webFront/productDetail";
	}
	
	
	
	
	
	
	@GetMapping("/webFront/center")
	public String center(
			  @RequestParam(value="nowPage", required=false)String nowPage, 
			  @RequestParam(value="cntPerPage", required=false)String cntPerPage, 
				HttpServletRequest req, Model model, PageInfo pi) {
		String gesi_code = "GS001";
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
		
		return "webFront/center";
	}
	
	
	@GetMapping("/webFront/QnaInsert")
	public String qnainsert(Model model) {
		
		List<QnaType> qnatype; 
		qnatype = qnaService.select();

		model.addAttribute("qnaType", qnatype);
		
		return "webFront/QnaInsert";
	}
	
	
	@RequestMapping (value="webFront/qna.add", method = RequestMethod.GET)
	public String qnaadd(
							Model model,
							@RequestParam String user_name,
							@RequestParam String gesi_title,
							@RequestParam String qnatype,
							@RequestParam String user_id,
							@RequestParam String gesi_content
							) {
		Map<String, Object> qnaAdd = new HashMap<>();
		qnaAdd.put("user_name", user_name);
		qnaAdd.put("gesi_title", gesi_title);
		qnaAdd.put("qnatype", qnatype);
		qnaAdd.put("user_id", user_id);
		qnaAdd.put("gesi_content", gesi_content);
		qnaAdd.put("gesi_code", "GS001");
		
		int addnum = qnaService.qnaAdd(qnaAdd);
		
		if(addnum > 0) {
			List<GesiVO> lately;
			lately = qnaService.lately(qnaAdd);
			 System.out.println(lately);
			 Map<String, Object> latelyList = new HashMap<>();
			 latelyList.put("gesi_code", lately.get(0).getGesi_code());
			 latelyList.put("gesi_id", lately.get(0).getGesi_id());
			 latelyList.put("qna_code", qnatype);
			 
			 int addnum2 = qnaService.qnaAdd2(latelyList);

			 
		}
		
		return "webFront/center";
	}
	
	@GetMapping("/webFront/cart.add")
	public String cartAdd(
							@RequestParam String name,
							@RequestParam String price,
							@RequestParam List size,
							@RequestParam List color,
							@RequestParam String pro_ea, Model model){
		
		System.out.println(color.size());
		List<CartVO> cart;
		for(int i=0; i<color.size(); i++) {
//			cart.add(i,  );
		}
		Map<String, Object> cartInfo = new HashMap<>();
		cartInfo.put("pro_name", name);
		cartInfo.put("pro_price", price);
		cartInfo.put("pro_size", size);
		cartInfo.put("pro_ea", pro_ea);
		
		
		System.out.println(cartInfo);
		return "/webFront/main";
	}
	
	@GetMapping("/webFront/QnaDetail")
	public String qnaDetail() {
		
		return "webFront/QnaDetail";
	}
	
	
	
}
