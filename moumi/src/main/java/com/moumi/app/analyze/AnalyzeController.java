package com.moumi.app.analyze;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.moumi.app.HomeService;
import com.moumi.app.common.MyExcelView;

@Controller("analyze.analyzeController")
public class AnalyzeController {
	@Autowired
	private HomeService service;
	
	@GetMapping(value = "/analyze/chart")
	@ResponseBody
	public Map<String, Object> chart(@RequestParam String kwd,
			@RequestParam(defaultValue = "0") String startDate,
			@RequestParam(defaultValue = "0") String endDate, HttpServletRequest req) throws Exception {
	
		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}
	
	
	List<Map<String, Object>> twitCountList = service.twitCount(kwd, startDate, endDate);
	List<Map<String, Object>> blogCountList = service.blogCount(kwd, startDate, endDate);
	List<Map<String, Object>> instaCountList = service.instaCount(kwd, startDate, endDate);
	
	Map<String, Object> model = new HashMap<String, Object>();
	model.put("twitCountList", twitCountList);
	model.put("blogCountList", blogCountList);
	model.put("instaCountList", instaCountList);
	
	return model;
	
	}
	
	@RequestMapping("excel")
	public View excelView(Map<String, Object> model) throws Exception {
		// 데이터를 리스트로 반환해줄 서비스
		
		String sheetName = "채널별 건수";
		List<String> columnLabels = new ArrayList<String>();
		List<Object[]> columnValues = new ArrayList<Object[]>();
		
		columnLabels.add("날짜");
		columnLabels.add("키워드");
		columnLabels.add("블로그");
		columnLabels.add("트위터");
		columnLabels.add("인스타그램");
		
		// dto에 리스트 담기
		/*
		for(Count dto : list) {
			//columnValues.add();
		}
		*/
		model.put("filename", "analyze.xlsx");
		model.put("sheetName", sheetName);
		model.put("columnLabels", columnLabels);
		model.put("columnValues", columnValues);
		
		return new MyExcelView(); // 엑셀 다운로드
	}

}
