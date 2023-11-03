package com.hyun.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hyun.util.FileUtils;
import com.hyun.dto.Criteria;
import com.hyun.dto.PageDTO;
import com.hyun.domain.ProductVO;
import com.hyun.service.AdvertProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@RequestMapping("/admin/product/*")
@Controller
public class AdvertProductController {
	
	private final AdvertProductService advertProductService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	// ckeditor 이미지 업로드 폴더경로 주입작업
	@Resource(name="uploadCKPath")
	private String uploadCKPath;
	   
	
	//상품등록폼
	@GetMapping("/prod_insert")
	public void prod_insert() {
		
		log.info("상품등록 폼");
	}
	//상품등록 저장
	@PostMapping("/prod_insert")
	public String prod_insert(ProductVO vo , MultipartFile uploadFile, RedirectAttributes rttr) {

		log.info("상품정보 " + vo);
		
		String dateFolder = FileUtils.getDateFolder();
		String savedFileName = FileUtils.uploadFile(uploadPath, dateFolder, uploadFile);
		
		log.info("상품정보 " + vo);
		
		vo.setProd_img(savedFileName);
		vo.setProd_up_folder(dateFolder);
		
		advertProductService.prod_insert(vo);
		
		return "redirect:/리스트";
	}
	
	   @PostMapping("/imageUpload")
	   public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) {
		   OutputStream out = null;
		   PrintWriter printWriter = null; 
		   

		   response.setCharacterEncoding("utf-8");
		   response.setContentType("text/html; charset=utf-8");
		
		   try {
			   
			   //1) 파일 업로드 작업
			   String fileName = upload.getOriginalFilename(); //클라이언트에서 전송한 파일이름
			   byte[] bytes = upload.getBytes(); //업로드 한 파일을 byte배열로 읽어들임.
			   
			   
			   String ckUploadPath = uploadCKPath + fileName;
			   log.info("CKEditor파일경로: " + ckUploadPath);
			   
			   out = new FileOutputStream(new File(ckUploadPath)); //0kb 파일생성
			   
			   out.write(bytes);//출력스트림작업
			   out.flush();
			   
			 //2) 파일 업로드 작업후 파일정보를 CKEditor로 보내는작업
			   printWriter = response.getWriter();
			   
			 //브라우저의 CKEditor에서 사용할 업로드한 파일정보를 경로설정.
			 // 1)톰캣 Context Path에서 Add External Web Module 작업을 해야 함.
			     // Path : /upload, Document Base : C:\\dev\\upload\\ckeditor 설정
			     // 2)Tomcat server.xml에서 <Context docBase="업로드경로" path="/매핑주소" reloadable="true"/>
			   	 
			   
			   		 //Ckeditor에서 업로드된 파일경로를 보내준다.(매핑주소와 파일명이 포함)
			         String fileUrl = "/ckupload/" + fileName;
			         // {"filename":"abc.gif", "uploaded":1, "url":"/upload/abc.gif"}
			         printWriter.println("{\"filename\":\"" +  fileName + "\", \"uploaded\":1,\"url\":\"" + fileUrl + "\"}");
			         printWriter.flush();
			   
		   }catch(Exception e) {
			   e.printStackTrace();
		   }finally {
			   if(out != null) {
				   try {
					   out.close();
				   }catch(Exception ex) {
					   ex.printStackTrace();
				   }
			   }
			   if(printWriter != null) printWriter.close();
		   }
	   }
	
	   @GetMapping("/prod_list")
	   public void prod_list(Criteria cri, Model model) throws Exception {
		   
			List<ProductVO> prod_list = advertProductService.prod_list(cri);
			
			//날짜폴더의 역슬래시를 슬래시로 바꾸는 작업, 역슬래시로 되어있는 정보가 스프링으로 보내는 요청데이터에 사용되면 에러발생.
			prod_list.forEach(vo -> {
				vo.setProd_up_folder(vo.getProd_up_folder().replace("\\", "/"));
			});
			
			model.addAttribute("prod_list", prod_list);
			
			int totalcount = advertProductService.getTotalCount(cri);
			model.addAttribute("pageMaker", new PageDTO(cri, totalcount));
	   }
}
