package com.egg.tfox.controller.product;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.egg.tfox.entity.Files;
import com.egg.tfox.entity.Manuf;
import com.egg.tfox.entity.Product;
import com.egg.tfox.entity.Product_file;
import com.egg.tfox.entity.Stock;
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
	public String product(
							HttpServletResponse rep,
							HttpServletRequest req,	
						   @ModelAttribute Product product,
						   @ModelAttribute Stock stock,
						   @RequestParam String a,
						   @RequestParam String b
						   
			) {
		//파일이 들어 왔는지 확인 
		System.out.println(product);
		String path = req.getSession().getServletContext().getRealPath("/resources/img/product");
		stock.setSt_orign(a+" : "+b);
		System.out.println(stock);
		   sqlSession.insert("product.stock", stock);
		
			String no = sqlSession.selectOne("product.seq");
			product.setPro_id(no);
		   int  count = sqlSession.insert("product.add", product);
		   System.out.println(count);
		 System.out.println("path : " + path);

		 try { 
	            // MultipartHttpServletRequest 생성 
	            MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req; 
	            Iterator iter = mhsr.getFileNames(); 
	            MultipartFile mfile = null; 
	            String fieldName = ""; 
	         
	            
	            // 디레토리가 없다면 생성 
	            File dir = new File(path); 
	            if (!dir.isDirectory()) { 
	                dir.mkdirs(); 
	            } 
	            
	            // 값이 나올때까지 
	            while (iter.hasNext()) { 
	                fieldName = (String) iter.next(); // 내용을 가져와서 
	                mfile = mhsr.getFile(fieldName); 
	                String origName; 
	                
	                origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 
	                
	                System.out.println("origName: " + origName);
	                // 파일명이 없다면 
	                if ("".equals(origName)) {
	                    continue; 
	                } 
	                // 파일 명 변경(uuid로 암호화) 
	                String ext = origName.substring(origName.lastIndexOf('.')); // 확장자 
	                String saveFileName = getUuid() + ext;
	               // String saveFileName = origName;
	                System.out.println("saveFileName : " + saveFileName);
	                String file_size = String.valueOf( mfile.getSize());
	                
	                String file_seq = sqlSession.selectOne("product.product_file_seq");
	                
	                Product_file files = Product_file.builder()
	                		.file_id(file_seq)
	                		.file_size(file_size)
	                		.file_type(mfile.getContentType())
	                		.file_originName(origName)
	                		.file_changeName(saveFileName)
	                		
	                		.build();
	                
	                System.out.println(files);
	                sqlSession.insert("product.pFiles", files);
	                
	               Files fl = Files.builder()
	            		   .file_id(file_seq)
	            		   .pro_id(no)
	            		   
	            		   .build();
	                sqlSession.insert("product.files",fl);
	                
	                // 설정한 path에 파일저장 
	                File serverFile = new File(path + File.separator + saveFileName);
	                mfile.transferTo(serverFile);
	        
	            }
	            
	    
	            } catch (UnsupportedEncodingException e) { 
	                // TODO Auto-generated catch block 
	                e.printStackTrace(); 
	            }catch (IllegalStateException e) { // TODO Auto-generated catch block 
	                e.printStackTrace();
	            } catch (IOException e) { // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        
	return "redirect:/product/productList";
	
	
}

	   //uuid생성
    public static String getUuid() { 
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
    
    @GetMapping("/product/productList")
    public String productList(Model model ) {
    	
    	List<Product> list = sqlSession.selectList("product.list");
    	
    	
    	model.addAttribute("list", list);
    	
    	
    	return "/product/productList";
    }
    
	@GetMapping("product/download")
	public void download(
			HttpServletRequest req,	
			HttpServletResponse response,
			@RequestParam String no) throws IOException {
		
		//1. no를 이용해서 MenuImage 정보를 불러온다
		Product_file image = sqlSession.selectOne("product.find", no);
		
		//2. image의 정보를 이용해서 실제 파일을 불러온다
		String path = req.getSession().getServletContext().getRealPath("/resources/img/product");
		File target = new File(path, image.getFile_changeName());
		byte[] data = FileUtils.readFileToByteArray(target);//common-io의 명령
		
		//3. 사용자에게 보낼 정보 추가(header)
		response.setHeader("Content-Length", image.getFile_size());
		response.setHeader("Content-Type", "application/octet-stream; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(image.getFile_changeName(), "UTF-8")+"\"");
		
		//4. 사용자에게 파일을 전송(body)
		response.getOutputStream().write(data);
		
	}
	
	
	@GetMapping("/product/detail")
	public String viewDetail(Model model ,@RequestParam String no ) {
		

    	Product pro = sqlSession.selectOne("product.listD", no);
    	
    	model.addAttribute("pro", pro);
		return "/product/viewDetail";
	}
    
	 
}
