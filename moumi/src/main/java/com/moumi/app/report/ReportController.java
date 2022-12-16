package com.moumi.app.report;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("report.reportController")
@RequestMapping(value = "/report/*")
public class ReportController {
	@RequestMapping(value = "reportList")
	public String list() {
		return ".report.reportList";
	}

}
