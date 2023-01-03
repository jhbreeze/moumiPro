package com.moumi.app.admin.chatting;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("admin.chatting.chattingController")

@RequestMapping("/admin/chatting/*")
public class ChattingController {
	
	@RequestMapping("main")
	public String main(HttpServletRequest req, Model model) throws Exception {
		
		String cp = req.getContextPath();
		String wsURL = "ws://"+req.getServerName()+":"+req.getServerPort()+cp+"/chat.msg";
		model.addAttribute("wsURL", wsURL);
		
		return ".admin.chatting.main";
	}
}
