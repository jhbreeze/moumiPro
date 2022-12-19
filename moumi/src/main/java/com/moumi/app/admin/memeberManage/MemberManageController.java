package com.moumi.app.admin.memeberManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.memberManage.memberManageController")

@RequestMapping("/admin/memberManage/*")
public class MemberManageController {
	
	@RequestMapping("list")
	public String memberManage() {
		return ".admin.memberManage.list";
	}

}
