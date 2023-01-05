package com.moumi.app.admin.sales;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("admin.sales.salesController")

@RequestMapping("/admin/sales/*")
public class SalesController {
	@Autowired
	private SalesService service;
	
	
	@RequestMapping(value = "list")
	public String main(@RequestParam(value = "pageNo", defaultValue = "1") int current_page, 
			Model model) throws Exception {
		
		return ".admin.sales.list";
	}
	
	
	@GetMapping(value = "/admin/charts")
	@ResponseBody
	public Map<String, Object> total(){
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH)+1;
		int d = cal.get(Calendar.DATE);
		
		String date = String.format("%04d-%02d-%02d", y, m ,d);
		String month = String.format("%04d%02d", y, m);
		
		List<Map<String, Object>> days = service.dayTotalMoney(date);
		
		if(d < 20) {
			cal.add(Calendar.MONTH, -1);
			m = cal.get(Calendar.MONTH) + 1;
			month = String.format("%04d%02d", y, m);
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("days", days);
		
		return model;
	}

}
