package com.moumi.app.admin.main;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moumi.app.admin.comment.Comment;
import com.moumi.app.common.MyUtil;

@Controller("admin.main.mainController")
public class MainController {
	@Autowired
	private MainTotalService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String main(@RequestParam(defaultValue = "") String gender, 
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "0")int status,
			HttpServletRequest req,
			Model model) {
		
		Map<String, Object> today = service.todaySales();
		Map<String, Object> todayW = service.todaySalesW();
		Map<String, Object> todayM = service.todaySalesM();
		Map<String, Object> thisMonth = service.thisMonthSales();
		Map<String, Object> previousMonth = service.previousMonthSales();
		
		int size = 3;
		int total_page= 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1)*size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Comment> list = service.listComment(map);
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("status", status);
		model.addAttribute("dataCount", dataCount);
		
		model.addAttribute("today", today);
		model.addAttribute("todayW", todayW);
		model.addAttribute("todayM", todayM);
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
		
		String month = String.format("%04d%02d", y, m);
		
		
		if(d < 20) {
			cal.add(Calendar.MONTH, -1);
			m = cal.get(Calendar.MONTH) + 1;
			if(m == 12) {
				y = cal.get(Calendar.YEAR);
			}
			month = String.format("%04d%02d", y, m);
		}
		Map<String, Object> dayOfWeek = service.dayOfWeekTotalCount(month);
		dayOfWeek.put("month", month);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("dayOfWeek", dayOfWeek);
		
		return model;
	}

}
