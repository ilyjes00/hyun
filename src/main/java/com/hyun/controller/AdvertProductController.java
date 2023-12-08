package com.hyun.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hyun.util.FileUtils;
import com.hyun.dto.Criteria;
import com.hyun.dto.PageDTO;
import com.hyun.service.AdCategoryService;
import com.hyun.domain.CategoryVO;
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
	private final AdCategoryService adCategoryService;
	
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
		
		return "redirect:/admin/product/prod_list";
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
		   
		   //10 ->2
		    cri.setAmount(2);
		   
			List<ProductVO> prod_list = advertProductService.prod_list(cri);
			
			
			//날짜폴더의 역슬래시를 슬래시로 바꾸는 작업, 역슬래시로 되어있는 정보가 스프링으로 보내는 요청데이터에 사용되면 에러발생.
			prod_list.forEach(vo -> {
				vo.setProd_up_folder(vo.getProd_up_folder().replace("\\", "/"));
			});
			
			model.addAttribute("prod_list", prod_list);
			log.info(cri);
			log.info(prod_list);
			
			int totalcount = advertProductService.getTotalCount(cri);
			model.addAttribute("pageMaker", new PageDTO(cri, totalcount));
	   }
	   
	   @ResponseBody
	   @GetMapping("/imageDisplay")
	   public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName)throws Exception {
		   
		   return FileUtils.getFile(uploadPath + dateFolderName, fileName);
	   }
	   @ResponseBody
	   @PostMapping("/prod_checked_modify1")
	   public ResponseEntity<String> prod_checked_modify1(
			   @RequestParam("prod_num_arr[]") List<Integer> prod_num_arr,
			   @RequestParam("prod_price_arr[]") List<Integer> prod_price_arr,
			   @RequestParam("prod_buy_arr[]") List<String> prod_buy_arr
			   ) throws Exception{
		   
		   log.info("상품코드: " + prod_num_arr);
		   log.info("가격: " + prod_price_arr);
		   log.info("판매여부: " + prod_buy_arr);
		   
		   ResponseEntity<String> entity = null;
		   
		   advertProductService.prod_checked_modify1(prod_num_arr, prod_price_arr, prod_buy_arr);
		   
		   entity = new ResponseEntity<String>("success", HttpStatus.OK);
		   
		   return entity;
		   
	   }
	   @ResponseBody
	   @PostMapping("/prod_checked_modify2")
	   public ResponseEntity<String> prod_checked_modify2(
			   @RequestParam("prod_num_arr[]") List<Integer> prod_num_arr,
			   @RequestParam("prod_price_arr[]") List<Integer> prod_price_arr,
			   @RequestParam("prod_buy_arr[]") List<String> prod_buy_arr
			   ) throws Exception{
		   
		   log.info("상품코드: " + prod_num_arr);
		   log.info("가격: " + prod_price_arr);
		   log.info("판매여부: " + prod_buy_arr);
		   
		   ResponseEntity<String> entity = null;
		   
		   advertProductService.prod_checked_modify2(prod_num_arr, prod_price_arr, prod_buy_arr);
		   
		   entity = new ResponseEntity<String>("success", HttpStatus.OK);
		   
		   return entity;
	   }
	   
	   @GetMapping("/prod_edit")
	   public void prod_edit(@ModelAttribute("cri") Criteria cri, Integer prod_num, Model model)throws Exception{
		   
		   
		   
		   ProductVO productVO = advertProductService.prod_edit(prod_num);
		   //역슬래시를 슬래시로 변환하는 작업 (\ -> /)
		   //요청 타겟에서 유효하지 않은 문자가 발견되었습니다. 유효한 문자들은 RFC 7230과 RFC 3986에 정의되어 있습니다.
		   productVO.setProd_up_folder(productVO.getProd_up_folder().replace("\\", "/"));
		   
		   model.addAttribute("productVO", productVO);
		   // 1차 전체카테고리 GlobalControllerAdvice 클래스 Model 참조
		   
		   // 상품카테고리에서 2차카테고리를 이용한 1차카테고리 정보를 참조.
		   // productVO.getCg_code() : 상품테이블에 있는 2차카테고리 코드
		   CategoryVO oneCategory = adCategoryService.get(productVO.getCgt_code());
		   model.addAttribute("one_category", adCategoryService.get(productVO.getCgt_code()));
		   
		   //1차카테고리 부모로 둔 2차카테고리 정보. EX> TOP(1) : 
		   //현재 상품의 1차카테고리 코드 firstCategory.getCg_parent_code()
		   model.addAttribute("two_categoryList", adCategoryService.getTwoCategoryList(oneCategory.getCgt_parent_code()));
		  
	   }
	   
	   //상품수정
	   @PostMapping("/prod_edit")
	   public String prod_edit(Criteria cri, ProductVO vo, MultipartFile uploadFile, RedirectAttributes rttr)throws Exception{
		   
		   //상품리스트에서 사용할 정보
		   log.info("cri" + cri);
		   //상품수정내용
		   log.info("vo" + vo);
		   
		   //작업
		   // 파일이 변경될 경우 해야할 작업  /  1)기존이미지파일 삭제  2)업로드작업
		   // 참고> 클라이언트 파일명을 db에 저장하는 부분.. uploadFile.getSize() > 0
		   if(!uploadFile.isEmpty()) {
			   
			   //1)기존이미지파일삭제작업
			   FileUtils.deleteFile(uploadPath, vo.getProd_up_folder(), vo.getProd_img());
			   //2)업로드작업
			      String dateFolder = FileUtils.getDateFolder();
			      String saveFileName = FileUtils.uploadFile(uploadPath, dateFolder, uploadFile);


			   //3d에저장할 세로운 날짜폴더명및이미지명 변경작업.
			      vo.setProd_img(saveFileName);
			      vo.setProd_up_folder(dateFolder);
			   
		   }
		   		//db연동작업
		   		 advertProductService.prod_edit(vo);
		   
		   return "redirect:/admin/product/prod_list" + cri.getListLink();
	   }
	   
	   @PostMapping("/prod_delete")
	   public String prod_delete(Criteria cri, Integer prod_num)throws Exception{
		   
		   //db연동작업
		   advertProductService.prod_delete(prod_num);
		   
		   return "redirect:/admin/product/prod_list" + cri.getListLink();
	   }
	   
}
