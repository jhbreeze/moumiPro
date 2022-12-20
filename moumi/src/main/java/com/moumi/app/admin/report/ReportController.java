package com.moumi.app.admin.report;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.report.reportController")

@RequestMapping("/admin/report/*")
public class ReportController {
	
	@RequestMapping("list")
	public String reportManage() {
		return ".admin.report.list";
	}

}
