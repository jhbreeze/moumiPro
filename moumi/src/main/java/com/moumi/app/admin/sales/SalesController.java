package com.moumi.app.admin.sales;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moumi.app.common.MyUtil;

@Controller("admin.sales.salesController")

@RequestMapping("/admin/sales/*")
public class SalesController {
	@Autowired
	private SalesService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "main")
	public String main(@RequestParam(value = "pageNo", defaultValue = "1") int current_page, 
			Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		return ".admin.salse.main";
	}
	
	
	@RequestMapping("list")
	public String salesManage() {
		return ".admin.sales.list";
	}
	
	@RequestMapping("list2")
	public String salesManage2() {
		return ".admin.sales.list2";
	}
	
	@RequestMapping("list3")
	public String salesManage3() {
		return ".admin.sales.list3";
	}

}
