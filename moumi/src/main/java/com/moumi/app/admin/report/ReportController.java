package com.moumi.app.admin.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moumi.app.common.MyUtil;

@Controller("admin.report.reportController")

@RequestMapping("/admin/report/*")
public class ReportController {
	@Autowired
	private ReportService service;
	
	@Autowired
	@Qualifier("myUtil")
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String reportManage(@RequestParam(defaultValue = "0") long reportNum,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			Model model) {
		
		String cp = req.getContextPath();
		
		int size = 6;
		int total_page;
		int dataCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Report> list = service.listReport(map);
		
		String listUrl = cp + "/admin/report/list?reportNum="+reportNum;
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("reportNum", reportNum);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".admin.report.list";
	}

}
