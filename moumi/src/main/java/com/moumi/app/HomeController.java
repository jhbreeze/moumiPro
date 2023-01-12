package com.moumi.app;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moumi.app.common.MyUtil;

@Controller()

public class HomeController {
	@Autowired
	private HomeService service;

	@Autowired
	@Qualifier("myUtil")
	private MyUtil myUtil;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		List<Region> listRegion = service.listRegion(map); // 지도 지역 카테고리
		List<Report> listMainReport = service.listMainReport(map); // 분석 리포트

		model.addAttribute("listRegion", listRegion);
		model.addAttribute("listMainReport", listMainReport);

		return ".home";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String api() throws Exception {
		// 간단한 지도 만들기 및 마커 찍기
		return "ajax_local_callback";
	}

	@GetMapping(value = "reportList")
	public String reportlist(@RequestParam(defaultValue = "0") long reportNum,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req, Model model) throws Exception {

		int size = 8;
		int total_page;
		int dataCount;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if (current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<Report> list = service.listReport(map);

		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/report/list";
		String articleUrl = cp + "/report/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/report/list?" + query;
			articleUrl = cp + "/report/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("reportNum", reportNum);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".report.list";
	}

	@RequestMapping("article")
	public String article(@RequestParam long reportNum, Model model) throws Exception {

		try {
			// keyword = URLDecoder.decode(keyword, "utf-8");

//			String query = "page=" + page;
//			if (keyword.length() != 0) {
//				query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
//			}

			Report dto = service.readReport(reportNum);
			if (dto == null) {
				return "redirect:/report/list";
			}

			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("condition", condition);
//			map.put("keyword", keyword);
			map.put("reportNum", reportNum);

			model.addAttribute("dto", dto);

			// Report preReadDto = service.preReadReport(map);
			// Report nextReadDto = service.nextReadReport(map);

			// List<Report> listFile = service.listReportFile(reportNum);

			model.addAttribute("dto", dto);
			// model.addAttribute("listFile", listFile);
			// model.addAttribute("preReadDto", preReadDto);
			// model.addAttribute("nextReadDto", nextReadDto);
			// model.addAttribute("page", page);
			// model.addAttribute("query", query);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return ".report.article";
	}

	@RequestMapping(value = "farm")
	public String farm() throws Exception {

		return ".api.api";
	}

	@PostMapping(value = "analyze")
	public String search(@RequestParam String kwd, Model model) throws Exception {
	
		 List<SNS> list = service.search(kwd);
		 
		model.addAttribute("list", list);
		model.addAttribute("kwd", kwd);



		return ".search.search";
	}
	

	
/*	
	@RequestMapping("/search/searchResult")
	@ResponseBody
	public Map<String, Object> searchResult(@RequestParam String kwd) throws Exception {
		Map<String, Object> model = service.search(kwd);

		return model;

	}
	
*/

	
//	@RequestMapping("/search/searchResult")
//	public String search(@RequestParam String kwd, Model model) throws Exception {
//		Map<String, Object> twit = service.search(kwd);
//		model.addAttribute("twit", twit);
//		return ".search.search";
//
//	}
}