package com.moumi.app.admin.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.community.communityController")

@RequestMapping("/admin/community/*")
public class CommunityController {
	
	@RequestMapping("list")
	public String communityManage() {
		return ".admin.community.list";
	}

}
