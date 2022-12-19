package com.moumi.app.admin.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.notice.noticeController")

@RequestMapping("/admin/notice/*")
public class NoticeController {
	
	@RequestMapping("list")
	public String memberManage() {
		return ".admin.notice.list";
	}

}
