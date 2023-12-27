package com.hyun.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Service;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.hyun.domain.OrderDetailInfoVO;
import com.hyun.domain.OrderDetailProductVO;
import com.hyun.domain.OrderVO;
import com.hyun.dto.Criteria;
import com.hyun.mapper.AdOrderMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdOrderServiceImpl implements AdOrderService {

	private final AdOrderMapper adOrderMapper;

	@Override
	public List<OrderVO> order_list(Criteria cri, String start_date, String end_date) {
		// TODO Auto-generated method stub
		return adOrderMapper.order_list(cri, start_date, end_date);
	}

	@Override
	public int getTotalCount(Criteria cri, String start_date, String end_date) {
		// TODO Auto-generated method stub
		return adOrderMapper.getTotalCount(cri, start_date, end_date);
	}

	@Override
	public List<OrderDetailInfoVO> orderDetailInfo1(Long ord_code) {
		// TODO Auto-generated method stub
		return adOrderMapper.orderDetailInfo1(ord_code);
	}

	@Override
	public List<OrderDetailProductVO> orderDetailInfo2(Long ord_code) {
		// TODO Auto-generated method stub
		return adOrderMapper.orderDetailInfo2(ord_code);
	}

	@Override
	public void order_product_delete(Long ord_code, Integer prod_num) {
		// TODO Auto-generated method stub
		adOrderMapper.order_product_delete(ord_code, prod_num);
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
		public void getReserveExcel(OrderVO OrderVO, HttpServletRequest request, HttpServletResponse response)throws Exception{
		List<OrderVO> list = adOrderMapper.getReserveExcel(OrderVO);
		  
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
		  cell.setCellValue("주문번호");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(2);
		  cell.setCellValue("아이디");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(3);
		  cell.setCellValue("이름");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(4);
		  cell.setCellValue("우편번호");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(5);
		  cell.setCellValue("주소명");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(6);
		  cell.setCellValue("상세주소");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(7);
		  cell.setCellValue("전화번호");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(8);
		  cell.setCellValue("가격");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(9);
		  cell.setCellValue("주문날짜");
		  setHeaderCS(cs, font, cell);
		  
		  
		 
		  int i = 2;
		  int ii = list.size();
		  for (OrderVO vo : list) {
		      
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String cretDate = sdf.format(vo.getOrd_regdate());
		 
		  row = sheet.createRow(i);
		  cell = null;
		  cs = wb.createCellStyle();
		  font = wb.createFont();
		 
		  cell = row.createCell(0);
		  cell.setCellValue(ii);
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(1);
		  cell.setCellValue(vo.getOrd_code());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(2);
		  cell.setCellValue(vo.getMbsp_id());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(3);
		  cell.setCellValue(vo.getOrd_name());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(4);
		  cell.setCellValue(vo.getOrd_zipcode());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(5);
		  cell.setCellValue(vo.getOrd_addr_basic());
		  setCmmnCS2(cs, cell);
		  
		  
		  cell = row.createCell(6);
		  cell.setCellValue(vo.getOrd_addr_detail());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(7);
		  cell.setCellValue(vo.getOrd_tel());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(8);
		  cell.setCellValue(vo.getOrd_price());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(9);
		  cell.setCellValue(cretDate);
		  setCmmnCS2(cs, cell);
		  		  
		  i++;
		  ii--;
		}
		  
		  response.setHeader("Set-Cookie", "fileDownload=true; path=/");
		  response.setHeader("Content-Disposition", String.format("attachment; filename=\"OrderList.xlsx\""));

			wb.write(response.getOutputStream());
		 
		}

	
}
