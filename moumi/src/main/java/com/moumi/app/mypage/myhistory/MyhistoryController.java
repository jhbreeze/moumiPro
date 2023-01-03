package com.moumi.app.mypage.myhistory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mypage.myhistoryController")
@RequestMapping("/mypage/myhistory/*")
public class MyhistoryController {
	
	@RequestMapping(value = "main")
	public String Main(Model model) throws Exception {
		
		
		return ".mypage.myhistory.main";
	}

	
}
