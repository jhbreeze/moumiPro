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
	public String main(@RequestParam(defaultValue = "") String gender, 
			@RequestParam(defaultValue = "") String birth,
			Model model) throws Exception {
		
		return ".admin.sales.list";
	}
	
	
	@GetMapping(value = "charts")
	@ResponseBody
	public Map<String, Object> total(){
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH)+1;
		int d = cal.get(Calendar.DATE);
		
		String date = String.format("%04d-%02d-%02d", y, m ,d);
		String month = String.format("%04d%02d", y, m);
		
		// 1주간
		List<Map<String, Object>> days = service.dayTotalSales(date);
		
		List<Map<String, Object>> Wdays = service.dayTotalSalesW(date);
		List<Map<String, Object>> Mdays = service.dayTotalSalesM(date);
		
		List<Map<String, Object>> Tdays = service.dayTotalSalesT(date);
		List<Map<String, Object>> Edays = service.dayTotalSalesE(date);
		List<Map<String, Object>> Sdays = service.dayTotalSalesS(date);
		List<Map<String, Object>> Fdays = service.dayTotalSalesF(date);
		
		// 6개월간
		List<Map<String, Object>> months = service.monthTotalSales(month);
		
		List<Map<String, Object>> Wmonths = service.monthTotalSalesW(month);
		List<Map<String, Object>> Mmonths = service.monthTotalSalesM(month);
		
		List<Map<String, Object>> Tmonths = service.monthTotalSalesT(month);
		List<Map<String, Object>> Emonths = service.monthTotalSalesE(month);
		List<Map<String, Object>> Smonths = service.monthTotalSalesS(month);
		List<Map<String, Object>> Fmonths = service.monthTotalSalesF(month);
		
		// 6개월간(파이)
		List<Map<String, Object>> pies = service.monthTotalPie(month);
		
		List<Map<String, Object>> Wpies = service.monthTotalPieW(month);
		List<Map<String, Object>> Mpies = service.monthTotalPieM(month);
		
		List<Map<String, Object>> Tpies = service.monthTotalPieT(month);
		List<Map<String, Object>> Epies = service.monthTotalPieE(month);
		List<Map<String, Object>> Spies = service.monthTotalPieS(month);
		List<Map<String, Object>> Fpies = service.monthTotalPieF(month);
		if(d < 20) {
			cal.add(Calendar.MONTH, -1);
			m = cal.get(Calendar.MONTH) + 1;
			month = String.format("%04d%02d", y, m);
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("days", days);
		
		model.put("Wdays", Wdays);
		model.put("Mdays", Mdays);
		
		model.put("Tdays", Tdays);
		model.put("Edays", Edays);
		model.put("Sdays", Sdays);
		model.put("Fdays", Fdays);
		
		model.put("months", months);
		
		model.put("Wmonths", Wmonths);
		model.put("Mmonths", Mmonths);
		
		model.put("Tmonths", Tmonths);
		model.put("Emonths", Emonths);
		model.put("Smonths", Smonths);
		model.put("Fmonths", Fmonths);
		
		model.put("pies", pies);
		
		model.put("Wpies", Wpies);
		model.put("Mpies", Mpies);
		
		model.put("Tpies", Tpies);
		model.put("Epies", Epies);
		model.put("Spies", Spies);
		model.put("Fpies", Fpies);
		
		return model;
	}

}
