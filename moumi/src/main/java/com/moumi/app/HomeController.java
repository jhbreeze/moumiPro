package com.moumi.app;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moumi.app.Report;

@Controller()

public class HomeController {
	@Autowired
	private HomeService service;


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		List<Region> listRegion = service.listRegion(map);
		List<Report> listMainReport = service.listMainReport(map);

		model.addAttribute("listRegion", listRegion);

		model.addAttribute("listMainReport", listMainReport);

		return ".home";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String api() throws Exception {
		// 간단한 지도 만들기 및 마커 찍기
		return "ajax_local_callback";
	}

}
