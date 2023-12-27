package com.hyun.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Service;

import com.hyun.domain.CategoryVO;
import com.hyun.domain.OrderVO;
import com.hyun.domain.ProductVO;
import com.hyun.dto.Criteria;
import com.hyun.dto.ProductDTO;
import com.hyun.mapper.AdvertProductMapper;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class AdvertProductServiceImpl implements AdvertProductService{

	
	private final AdvertProductMapper advertProductMapper;

	@Override
	public void prod_insert(ProductVO vo) {
		// TODO Auto-generated method stub
		advertProductMapper.prod_insert(vo);
	}

	@Override
	public List<ProductVO> prod_list(Criteria cri) {
		// TODO Auto-generated method stub
		return advertProductMapper.prod_list(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return advertProductMapper.getTotalCount(cri);
	}

	@Override
	public void prod_checked_modify1(List<Integer> prod_num_arr, List<Integer> prod_price_arr,
			List<String> prod_buy_arr) {
		for(int i=0; i<prod_num_arr.size(); i++) {
			advertProductMapper.prod_checked_modify1(prod_num_arr.get(i), prod_price_arr.get(i), prod_buy_arr.get(i));
		}
	}

	@Override
	public void prod_checked_modify2(List<Integer> prod_num_arr, List<Integer> prod_price_arr, List<String> prod_buy_arr) {
		List<ProductDTO> prod_modify_list = new ArrayList<ProductDTO>();
		
		for(int i=0; i<prod_num_arr.size(); i++) {
			ProductDTO productDTO = new ProductDTO(prod_num_arr.get(i), prod_price_arr.get(i), prod_buy_arr.get(i));
			prod_modify_list.add(productDTO);
		}
		
		advertProductMapper.prod_checked_modify2(prod_modify_list);
		
	}

	@Override
	public ProductVO prod_edit(Integer prod_num) {
		// TODO Auto-generated method stub
		return advertProductMapper.prod_edit(prod_num);
	}

	@Override
	public void prod_edit(ProductVO vo) {
		// TODO Auto-generated method stub
		advertProductMapper.prod_edit_ok(vo);
	}

	@Override
	public void prod_delete(Integer prod_num) {
		// TODO Auto-generated method stub
		advertProductMapper.prod_delete(prod_num);
	}
	
	

	//엑셀기능관련 작업
		private void setHeaderCS(CellStyle cs, Font font, Cell cell) {
			  cs.setAlignment(CellStyle.ALIGN_CENTER);
			  cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
			  cs.setBorderTop(CellStyle.BORDER_THIN);
			  cs.setBorderBottom(CellStyle.BORDER_THIN);
			  cs.setBorderLeft(CellStyle.BORDER_THIN);
			  cs.setBorderRight(CellStyle.BORDER_THIN);
			  cs.setFillForegroundColor(HSSFColor.GREY_80_PERCENT.index);
			  cs.setFillPattern(CellStyle.SOLID_FOREGROUND);
			  setHeaderFont(font, cell);
			  cs.setFont(font);
			  cell.setCellStyle(cs);
			}
			 
			private void setHeaderFont(Font font, Cell cell) {
			  font.setBoldweight((short) 700);
			  font.setColor(HSSFColor.WHITE.index);
			}
			 
			private void setCmmnCS2(CellStyle cs, Cell cell) {
			  cs.setAlignment(CellStyle.ALIGN_LEFT);
			  cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
			  cs.setBorderTop(CellStyle.BORDER_THIN);
			  cs.setBorderBottom(CellStyle.BORDER_THIN);
			  cs.setBorderLeft(CellStyle.BORDER_THIN);
			  cs.setBorderRight(CellStyle.BORDER_THIN);
			  cell.setCellStyle(cs);
			}
			 
			 
			@Override
			public void getReserveExcel(ProductVO ProductVO, HttpServletRequest request, HttpServletResponse response)throws Exception{
			List<ProductVO> list = advertProductMapper.getReserveExcel(ProductVO);
			  
			  SXSSFWorkbook wb = new SXSSFWorkbook();
			  Sheet sheet = wb.createSheet();
			  sheet.setColumnWidth((short) 0, (short) 2000);
			  sheet.setColumnWidth((short) 1, (short) 8000);
			  sheet.setColumnWidth((short) 2, (short) 3000);
			  sheet.setColumnWidth((short) 3, (short) 3000);
			  sheet.setColumnWidth((short) 4, (short) 8000);
			  sheet.setColumnWidth((short) 5, (short) 5000);
			  sheet.setColumnWidth((short) 6, (short) 3000);
			  sheet.setColumnWidth((short) 7, (short) 5000);
			  sheet.setColumnWidth((short) 8, (short) 5000);
			  sheet.setColumnWidth((short) 9, (short) 5000);
			  sheet.setColumnWidth((short) 10, (short) 5000);
			  
			  Row row = sheet.createRow(0);
			  Cell cell = null;
			  CellStyle cs = wb.createCellStyle();
			  Font font = wb.createFont();
			  cell = row.createCell(0);
			  cell.setCellValue("주문목록 관리 - 주문목록 리스트");
			  setHeaderCS(cs, font, cell);
			  sheet.addMergedRegion(new CellRangeAddress(row.getRowNum(), row.getRowNum(), 0, 6));
			  
			  row = sheet.createRow(1);
			  cell = null;
			  cs = wb.createCellStyle();
			  font = wb.createFont();
			  
			  cell = row.createCell(0);
			  cell.setCellValue("번호");
			  setHeaderCS(cs, font, cell);
			 
			  cell = row.createCell(1);
			  cell.setCellValue("상품코드");
			  setHeaderCS(cs, font, cell);
			  
			  cell = row.createCell(2);
			  cell.setCellValue("상품명");
			  setHeaderCS(cs, font, cell);
			  
			  cell = row.createCell(3);
			  cell.setCellValue("상룸가격");
			  setHeaderCS(cs, font, cell);
			  
			  cell = row.createCell(4);
			  cell.setCellValue("상품할인율");
			  setHeaderCS(cs, font, cell);
			  
			  cell = row.createCell(5);
			  cell.setCellValue("상품브랜드명");
			  setHeaderCS(cs, font, cell);
			  
			  cell = row.createCell(6);
			  cell.setCellValue("상품설명");
			  setHeaderCS(cs, font, cell);
			  
			  cell = row.createCell(7);
			  cell.setCellValue("상품수량");
			  setHeaderCS(cs, font, cell);
			  
			  cell = row.createCell(8);
			  cell.setCellValue("구매가능여부");
			  setHeaderCS(cs, font, cell);
			  
			  cell = row.createCell(9);
			  cell.setCellValue("상품올린날짜");
			  setHeaderCS(cs, font, cell);
			  
			  cell = row.createCell(10);
			  cell.setCellValue("상품수정날짜");
			  setHeaderCS(cs, font, cell);
			  
			 
			  int i = 2;
			  int ii = list.size();
			  for (ProductVO vo : list) {
			      
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String cretDate = sdf.format(vo.getProd_date());
			String cretDate2 = sdf.format(vo.getProd_updatedate());
			 
			  row = sheet.createRow(i);
			  cell = null;
			  cs = wb.createCellStyle();
			  font = wb.createFont();
			 
			  cell = row.createCell(0);
			  cell.setCellValue(ii);
			  setCmmnCS2(cs, cell);
			  
			  cell = row.createCell(1);
			  cell.setCellValue(vo.getCgt_code());
			  setCmmnCS2(cs, cell);
			  
			  cell = row.createCell(2);
			  cell.setCellValue(vo.getProd_name());
			  setCmmnCS2(cs, cell);
			  
			  cell = row.createCell(3);
			  cell.setCellValue(vo.getProd_price());
			  setCmmnCS2(cs, cell);
			  
			  cell = row.createCell(4);
			  cell.setCellValue(vo.getProd_discount());
			  setCmmnCS2(cs, cell);
			  
			  cell = row.createCell(5);
			  cell.setCellValue(vo.getProd_publisher());
			  setCmmnCS2(cs, cell);
			  
			  
			  cell = row.createCell(6);
			  cell.setCellValue(vo.getProd_content());
			  setCmmnCS2(cs, cell);
			  
			  cell = row.createCell(7);
			  cell.setCellValue(vo.getProd_amount());
			  setCmmnCS2(cs, cell);
			  
			  cell = row.createCell(8);
			  cell.setCellValue(vo.getProd_buy());
			  setCmmnCS2(cs, cell);
			  
			  cell = row.createCell(9);
			  cell.setCellValue(cretDate);
			  setCmmnCS2(cs, cell);
			  
			  cell = row.createCell(10);
			  cell.setCellValue(cretDate2);
			  setCmmnCS2(cs, cell);
			  		  
			  i++;
			  ii--;
			}
			  
			  response.setHeader("Set-Cookie", "fileDownload=true; path=/");
			  response.setHeader("Content-Disposition", String.format("attachment; filename=\"ProdList.xlsx\""));

				wb.write(response.getOutputStream());
			 
			}


}
