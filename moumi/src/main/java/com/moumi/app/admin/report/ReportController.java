package com.moumi.app.admin.report;

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
		
		int size = 0; 
		
		return ".admin.report.list";
	}

}
