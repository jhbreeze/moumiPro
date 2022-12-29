package com.moumi.app.admin.chatting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.chatting.chattingController")

@RequestMapping("/admin/chatting/*")
public class ChattingController {
	
	@RequestMapping("list")
	public String chattingManage() {
		return ".admin.chatting.list"; 
	}

}
