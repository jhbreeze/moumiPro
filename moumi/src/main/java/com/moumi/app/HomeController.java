package com.moumi.app;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller()

public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return ".home";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String api() throws Exception {
		// 간단한 지도 만들기 및 마커 찍기
		return "ajax_local_callback";
	}

}
