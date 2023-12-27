package com.hyun.service;

import java.text.SimpleDateFormat;
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

import com.hyun.domain.MemberVO;
import com.hyun.domain.ProductVO;
import com.hyun.dto.Criteria;
import com.hyun.mapper.AdMemberMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdMemberServiceImpl implements AdMemberService {
	
	private final AdMemberMapper adMemberMapper;

	@Override
	public List<MemberVO> list() {
		// TODO Auto-generated method stub
		return adMemberMapper.list();
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return adMemberMapper.getTotalCount(cri);
	}

	@Override
	public List<MemberVO> modify1(String mbsp_id) {
		// TODO Auto-generated method stub
		return adMemberMapper.modify1(mbsp_id);
	}

	@Override
	public void modify2(MemberVO vo) {
		// TODO Auto-generated method stub
		adMemberMapper.modify2(vo);
	}

	@Override
	public void delete(String mbsp_id) {
		// TODO Auto-generated method stub
		adMemberMapper.delete(mbsp_id);
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
		public void getReserveExcel(MemberVO MemberVO, HttpServletRequest request, HttpServletResponse response)throws Exception{
		List<MemberVO> list = adMemberMapper.getReserveExcel(MemberVO);
		  
		  SXSSFWorkbook wb = new SXSSFWorkbook();
		  Sheet sheet = wb.createSheet();
		  sheet.setColumnWidth((short) 0, (short) 2000);
		  sheet.setColumnWidth((short) 1, (short) 8000);
		  sheet.setColumnWidth((short) 2, (short) 3000);
		  sheet.setColumnWidth((short) 3, (short) 8000);
		  sheet.setColumnWidth((short) 4, (short) 8000);
		  sheet.setColumnWidth((short) 5, (short) 9000);
		  sheet.setColumnWidth((short) 6, (short) 9000);
		  sheet.setColumnWidth((short) 7, (short) 5000);
		  sheet.setColumnWidth((short) 8, (short) 5000);
		  sheet.setColumnWidth((short) 9, (short) 5000);
		  sheet.setColumnWidth((short) 10, (short) 5000);
		  sheet.setColumnWidth((short) 11, (short) 5000);
		  
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
		  cell.setCellValue("회원아이디");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(2);
		  cell.setCellValue("회원이름");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(3);
		  cell.setCellValue("이메일");
		  setHeaderCS(cs, font, cell);
		  
		  
		  cell = row.createCell(4);
		  cell.setCellValue("우편번호");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(5);
		  cell.setCellValue("주소");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(6);
		  cell.setCellValue("상세주소");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(7);
		  cell.setCellValue("전화번호");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(8);
		  cell.setCellValue("포인트");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(9);
		  cell.setCellValue("마지막로그인날짜");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(10);
		  cell.setCellValue("회원가입날짜");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(11);
		  cell.setCellValue("회원정보수정날짜");
		  setHeaderCS(cs, font, cell);
		  
		 
		  int i = 2;
		  int ii = list.size();
		  for (MemberVO vo : list) {
		      
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String cretDate = sdf.format(vo.getMbsp_lastlogin());
		String cretDate2 = sdf.format(vo.getMbsp_datesub());
		String cretDate3 = sdf.format(vo.getMbsp_updatedate());
		 
		  row = sheet.createRow(i);
		  cell = null;
		  cs = wb.createCellStyle();
		  font = wb.createFont();
		 
		  cell = row.createCell(0);
		  cell.setCellValue(ii);
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(1);
		  cell.setCellValue(vo.getMbsp_id());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(2);
		  cell.setCellValue(vo.getMbsp_name());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(3);
		  cell.setCellValue(vo.getMbsp_email());
		  setCmmnCS2(cs, cell);
		  
		  
		  cell = row.createCell(4);
		  cell.setCellValue(vo.getMbsp_zipcode());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(5);
		  cell.setCellValue(vo.getMbsp_addr());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(6);
		  cell.setCellValue(vo.getMbsp_deaddr());
		  setCmmnCS2(cs, cell);
		  
		  
		  cell = row.createCell(7);
		  cell.setCellValue(vo.getMbsp_phone());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(8);
		  cell.setCellValue(vo.getMbsp_point());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(9);
		  cell.setCellValue(cretDate);
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(10);
		  cell.setCellValue(cretDate2);
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(11);
		  cell.setCellValue(cretDate3);
		  setCmmnCS2(cs, cell);
		  		  
		  i++;
		  ii--;
		}
		  
		  response.setHeader("Set-Cookie", "fileDownload=true; path=/");
		  response.setHeader("Content-Disposition", String.format("attachment; filename=\"MemberList.xlsx\""));

			wb.write(response.getOutputStream());
		 
		}


}
