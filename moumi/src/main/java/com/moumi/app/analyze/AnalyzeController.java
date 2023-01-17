package com.moumi.app.analyze;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moumi.app.HomeService;

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

}
