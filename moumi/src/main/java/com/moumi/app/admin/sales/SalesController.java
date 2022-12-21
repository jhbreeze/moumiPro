package com.moumi.app.admin.sales;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.sales.salesController")

@RequestMapping("/admin/sales/*")
public class SalesController {
	
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
