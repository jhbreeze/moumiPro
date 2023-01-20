package com.moumi.app.common;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.document.AbstractXlsxView;


// AbstractExcelView는 spring 4.2 부터  deprecated 됨
// 높은 버전의 엑셀은 AbstractXlsxView 구현클래스로 작성(확장자는 xlsx) 
// 낮은 버전의 엑셀은 AbstractXlsView 구현클래스로 작성(확장자는 xls) 

@SuppressWarnings("unchecked")
@Service("excelView")
public class MyExcelView extends AbstractXlsxView {
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 클라이언트가 다운로드할 파일, 시트 이름 
		String filename = (String)model.get("filename");
		String sheetName = (String)model.get("sheetName");
		
		List<String> columnLabels = (List<String>)model.get("columnLabels"); // List = row개수
		List<Object[]> columnValues = (List<Object[]>)model.get("columnValues"); // Object 배열에 담는 이유 : 데이터에 점수(숫자), 문자(이름) 등 있으니까 
		
		response.setContentType("application/ms-excel"); // 서버가 클라이언트한테 전송하는 타입 
		response.setHeader("Content-disposition", "attachment; filename="+filename); // Content-disposition 위치 = 파일이름
		
		String kwd = (String) model.get("kwd");
		String startDate = (String) model.get("startDate");
		String endDate = (String) model.get("endDate");
		
		Sheet sheet = createSheet(workbook, 0, sheetName); // 시트1(empty sheet) 하나 만듦.
		
		createInfo(sheet, kwd, startDate, endDate);
		
		if(columnLabels != null) {
			createColumnLabel(sheet, columnLabels);
		}
		
		if(columnValues != null) {
			createColumnValue(sheet, columnValues);
		}

		
	}
	
	// sheet 생성
	/**
	 * @param workbook
	 * @param sheetIdx : sheet 인덱스(0부터 시작)
	 * @param sheetName
	 * @return
	 */
	private Sheet createSheet(Workbook workbook, int sheetIdx, String sheetName) {
		Sheet sheet=workbook.createSheet();
		workbook.setSheetName(sheetIdx, sheetName);
		return sheet;
	}
	
	private void createColumnLabel(Sheet sheet, List<String> columnLabels) {
		sheet.setColumnWidth(0, 256*15); // 채널명 폭
		sheet.setColumnWidth(1, 256*15); // 날짜 폭

		int idx = 4; // 제목행 위치 지정
		Row labelRow = sheet.createRow(idx);
		Cell cell;
		
		for(int i = 0; i < columnLabels.size(); i++) { // columnLabels 사이즈 만큼 cell 객체를 만듦.
			cell = labelRow.createCell(i);
			cell.setCellValue(columnLabels.get(i));
		}
	}
	
	//  내용(두번째 row 부터)
	private void createColumnValue(Sheet sheet, List<Object[]> columnValues) {
		Row row;
		Cell cell;
		
		for(int idx = 0; idx < columnValues.size(); idx++) {
			row = sheet.createRow(idx + 5); // 제목 다음줄
			
			Object[] values = columnValues.get(idx); // 데이터 삽입
			for(int col=0; col < values.length; col++) {
				try {
					cell = row.createCell(col);
					
					if(values[col] instanceof Byte) {
						cell.setCellValue((Byte) values[col]);
					} else if (values[col] instanceof Short) {
						cell.setCellValue((Short) values[col]);
					} else if (values[col] instanceof Integer) {
						cell.setCellValue((Integer) values[col]);
					} else if (values[col] instanceof Long) {
						cell.setCellValue((Long) values[col]);
					} else if (values[col] instanceof Float) {
						cell.setCellValue((Float) values[col]);
					} else if (values[col] instanceof Double) {
						cell.setCellValue((Double) values[col]);
					} else if (values[col] instanceof Character) {
						cell.setCellValue((Character) values[col]);
					} else if (values[col] instanceof Boolean) {
						cell.setCellValue((Boolean) values[col]);
					} else if (values[col] instanceof String) {
						cell.setCellValue((String) values[col]);
					} else {
						cell.setCellValue(values[col].toString());
					}
					
				} catch (Exception e) {
				}
			}
		}
	}
	
	//조회기간 출력하기
	public void createInfo(Sheet sheet, String kwd, String startDate, String endDate) {
		
		int idx = 0;
		sheet.setColumnWidth(idx, 256*15);

		Row kwdRow = sheet.createRow(1);
		Cell kwdCell = kwdRow.createCell(idx);
		kwdCell.setCellValue("분석 키워드 = " + kwd);
		
		
		Row dayRow = sheet.createRow(2);
		int dayCol = 0;
		Cell dayCell = dayRow.createCell(dayCol); // 두번째줄의 첫번째열을 셀로 지정. 즉 두번째줄 첫째칸
		
		dayCell.setCellValue("조회날짜 = " + startDate + " ~ " + endDate); // 두번째 행은 입력받은 날짜를 출력
	}
	
}
