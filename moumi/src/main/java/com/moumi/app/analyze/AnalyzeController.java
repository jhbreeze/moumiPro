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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.moumi.app.Count;
import com.moumi.app.HomeService;
import com.moumi.app.common.MyExcelView;

@Controller("analyze.analyzeController")
public class AnalyzeController {
	@Autowired
	private HomeService service;
	
	@Autowired
	private AnalyzeService aService;
	
	@GetMapping(value = "/analyze/chart")
	@ResponseBody
	public Map<String, Object> chart(@RequestParam String kwd, @RequestParam(defaultValue = "0") String startDate,
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
	
	@GetMapping("/analyze/excel")
	public View excelView(Map<String, Object> model, @RequestParam String kwd, 
			@RequestParam String startDate, @RequestParam String endDate,
			@RequestParam List<String> channels, HttpServletRequest req) throws Exception {
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}
		
		String sheetName = "채널별 언급량";
		
		List<String> columnLabels = new ArrayList<String>(); // 엑셀의 컬럼 
		List<Object[]> columnValues = new ArrayList<Object[]>(); // 엑셀 값 
		
		columnLabels.add("채널");
		columnLabels.add("날짜");
		columnLabels.add("언급량");
		
		for(String channel: channels) {
			if(channel.equals("twitter")) {
				String twitter = "twitter";
				
				// 데이터를 리스트로 반환해줄 서비스
				List<Count> list = aService.twitList(kwd, startDate, endDate, twitter);
				
				// 리스트에 있는 데이터들을 columnValues에 담기 
				for(Count dto : list) {
					columnValues.add(new Object[] { "트위터", dto.get_id(), dto.getResult()});
				}
				
			} else if(channel.equals("blog")) {
				String blog = "blog";
				List<Count> list = aService.blogList(kwd, startDate, endDate, blog);
				
				for(Count dto : list) {
					columnValues.add(new Object[] {"블로그", dto.get_id(), dto.getResult()});
				}
			} else {
				String instagram = "instagram";
				List<Count> list = aService.instaList(kwd, startDate, endDate, instagram);
				
				for(Count dto : list) {
					columnValues.add(new Object[] {"인스타그램", dto.get_id(), dto.getResult()});
				}
			}
			
		}
		
		
		model.put("filename", "analyze.xlsx");
		model.put("sheetName", sheetName);
		model.put("columnLabels", columnLabels);
		model.put("columnValues", columnValues);
		model.put("kwd", kwd);
		model.put("startDate", startDate);
		model.put("endDate", endDate);
		
		return new MyExcelView(); // 엑셀 다운로드
	}

}
