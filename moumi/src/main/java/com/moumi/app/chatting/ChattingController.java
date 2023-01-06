package com.moumi.app.chatting;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moumi.app.common.MyUtil;

@Controller("chat.chattingController")
@RequestMapping("/chatting/*")
public class ChattingController {
	@Autowired
	private UserChatService userChatService;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("main")
	public String main(HttpServletRequest req, Model model) throws Exception {
		
		String cp = req.getContextPath();
		String wsURL = "ws://"+req.getServerName()+":"+req.getServerPort()+cp+"/chat.msg";
		model.addAttribute("wsURL", wsURL);
		
		// 몽고 db 연결 부분
		long dataCount;
		
		dataCount = userChatService.dataCount();
		
		model.addAttribute("dataCount", dataCount);
		
		
		
		
		
		
		
		return ".chatting.main";
	}
	
	
}
