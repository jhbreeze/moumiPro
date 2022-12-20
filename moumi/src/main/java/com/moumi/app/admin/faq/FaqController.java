package com.moumi.app.admin.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.faq.faqController")

@RequestMapping("/admin/faq/*")
public class FaqController {
	
	@RequestMapping("list")
	public String faqManage() {
		return ".admin.faq.list";
	}

}
