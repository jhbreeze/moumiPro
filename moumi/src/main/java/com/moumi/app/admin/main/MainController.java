package com.moumi.app.admin.main;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("admin.main.mainController")
public class MainController {
	@Autowired
	private MainTotalService service;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String main(Model model) {
		
		Map<String, Object> today = service.todaySales();
		Map<String, Object> thisMonth = service.thisMonthSales();
		Map<String, Object> previousMonth = service.previousMonthSales();
		
		model.addAttribute("today", today);
		model.addAttribute("thisMonth", thisMonth);
		model.addAttribute("previousMonth", previousMonth);
		
		return ".adminLayout";
	}
	
	@GetMapping(value = "/admin/charts")
	@ResponseBody
	public Map<String, Object> total() {
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH)+1;
		int d = cal.get(Calendar.DATE);
		
		String date = String.format("%04d-%02d-%02d", y, m ,d);
		String month = String.format("%04d%02d", y, m);
		
		if(d < 20) {
			cal.add(Calendar.MONTH, -1);
			m = cal.get(Calendar.MONTH) + 1;
			month = String.format("%04d%02d", y, m);
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		return model;
	}

}
