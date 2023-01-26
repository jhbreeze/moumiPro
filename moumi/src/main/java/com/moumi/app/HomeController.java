package com.moumi.app;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moumi.app.common.APISerializer;
import com.moumi.app.common.MyUtil;
import com.moumi.app.member.SessionInfo;

@Controller
public class HomeController {
	@Autowired
	private HomeService service;

	@Autowired
	private APISerializer apiSerializer;

	@Autowired
	@Qualifier("myUtil")
	private MyUtil myUtil;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		List<Region> listRegion = service.listRegion(map); // 지도 지역 카테고리
		List<Report> listMainReport = service.listMainReport(map); // 분석 리포트

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String now = sdf.format(date);

		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, -30);
		String endDate = sdf.format(cal.getTime());

		List<Summary> keywordList = service.keywordList();

		model.addAttribute("listRegion", listRegion);
		model.addAttribute("listMainReport", listMainReport);
		model.addAttribute("now", endDate);
		model.addAttribute("endDate", now);
		model.addAttribute("keywordList", keywordList);

		return ".home";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String api() throws Exception {
		// 간단한 지도 만들기 및 마커 찍기
		return "ajax_local_callback";
	}

	@GetMapping(value = "/reportList")
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


			Report dto = service.readReport(reportNum);
			if (dto == null) {
				return "redirect:/report/list";
			}

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("reportNum", reportNum);

			model.addAttribute("dto", dto);
			model.addAttribute("dto", dto);

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
	public String search(@RequestParam String kwd, @RequestParam(defaultValue = "0") String youtube,
			@RequestParam(defaultValue = "0") String instagram, @RequestParam(defaultValue = "0") String blog,
			@RequestParam(defaultValue = "0") String twitter, @RequestParam(defaultValue = "0") String startDate,
			@RequestParam(defaultValue = "0") String endDate, Model model, HttpSession session, Keyword keyword)
			throws Exception {


		SessionInfo info = (SessionInfo)session.getAttribute("member");
		long loginCheck;
		int productCategory;
		// 몽고에 키워드 저장
		try {
			service.insertKeyword(kwd);
			loginCheck = info.getUserCode();
			productCategory = service.productCategory(loginCheck);
		} catch (Exception e) {
			loginCheck = 0;
			productCategory = 0;
		}
		List<SNS> list = service.search(kwd, youtube, instagram, blog, twitter, startDate, endDate);
		//List<String> topChannel = service.channel(kwd, startDate, endDate);
		System.out.println(startDate);
		System.out.println(endDate);
		String topChannel = service.channel(kwd, startDate, endDate,instagram, blog, twitter);

		List<Youtube> youtubeList = service.youtubeList(kwd);

		String topDay = service.day(kwd, startDate, endDate,instagram,blog,twitter);

		model.addAttribute("list", list);
		model.addAttribute("kwd", kwd);
		model.addAttribute("youtube", youtube);
		model.addAttribute("instagram", instagram);
		model.addAttribute("blog", blog);
		model.addAttribute("twitter", twitter);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("topChannel", topChannel);
		model.addAttribute("topDay", topDay);
		model.addAttribute("youtubeList", youtubeList);
		model.addAttribute("loginCheck", loginCheck);
		model.addAttribute("productCategory", productCategory);

		return ".search.search";
	}

	@GetMapping(value = "analyze")
	public String searchForm(@RequestParam String kwd, @RequestParam(defaultValue = "0") String youtube,
			@RequestParam(defaultValue = "0") String instagram, @RequestParam(defaultValue = "0") String blog,
			@RequestParam(defaultValue = "0") String twitter, @RequestParam(defaultValue = "0") String startDate,
			@RequestParam(defaultValue = "0") String endDate, Model model, HttpSession session, Keyword keyword)
			throws Exception {


		SessionInfo info = (SessionInfo)session.getAttribute("member");
		long loginCheck;
		int productCategory;
		// 몽고에 키워드 저장
		try {
			loginCheck = info.getUserCode();
			productCategory = service.productCategory(loginCheck);
		} catch (Exception e) {
			loginCheck = 0;
			productCategory = 0;
		}
		List<SNS> list = service.search(kwd, youtube, instagram, blog, twitter, startDate, endDate);
		//List<String> topChannel = service.channel(kwd, startDate, endDate);
		System.out.println(startDate);
		System.out.println(endDate);
		String topChannel = service.channel(kwd, startDate, endDate,instagram, blog, twitter);

		List<Youtube> youtubeList = service.youtubeList(kwd);

		String topDay = service.day(kwd, startDate, endDate,instagram,blog,twitter);

		model.addAttribute("list", list);
		model.addAttribute("kwd", kwd);
		model.addAttribute("youtube", youtube);
		model.addAttribute("instagram", instagram);
		model.addAttribute("blog", blog);
		model.addAttribute("twitter", twitter);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("topChannel", topChannel);
		model.addAttribute("topDay", topDay);
		model.addAttribute("youtubeList", youtubeList);
		model.addAttribute("loginCheck", loginCheck);
		model.addAttribute("productCategory", productCategory);

		return ".search.search";
	}


	@GetMapping("recommend")
	@ResponseBody
	public Map<String, Object> recommend(@RequestParam String kwd, @RequestParam String startDate, @RequestParam String endDate) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		try {
			String query = "kwd="+URLEncoder.encode(kwd, "utf-8")+"&startDate="+startDate+"&endDate="+endDate;
			String spec = "http://localhost:5000/recommend?"+query;
			String stringJson = apiSerializer.receiveToString(spec);
			System.out.print(stringJson);
			JSONArray jarr = new JSONArray(stringJson);
			List<Shop11> list = new ArrayList<Shop11>();
			for(int i=0; i<jarr.length(); i++) {
				JSONObject job = jarr.getJSONObject(i);
				Shop11 dto = new Shop11();
				String brand = job.getString("brand");
				String name = job.getString("name");
				String url = job.getString("url");
				String img = job.getString("img");
				Double grade = job.getDouble("grade");

				dto.setBrand(brand);
				dto.setName(name);
				dto.setUrl(url);
				dto.setImg(img);
				dto.setGrade(grade);
				list.add(dto);
			}
			System.out.println(list);

			model.put("list", list);
		} catch (Exception e) {

		}

		return model;
	}


	@GetMapping("/location")
	@ResponseBody
	public Map<String, Object> location(@RequestParam String code){
		Map<String, Object> model = new HashMap<String, Object>();

		try {
			Region dto = service.readRegion(code);

			model.put("dto", dto);

		} catch (Exception e) {
			// TODO: handle exception
		}

		return model;

	}


}