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

}
