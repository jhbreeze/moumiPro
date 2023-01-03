package com.moumi.app.mypage.mypick;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mypage.mypickController")
@RequestMapping("/mypage/mypick/*")
public class MypickController {
	
	@RequestMapping(value = "main")
	public String Main(Model model) throws Exception {
		
		
		return ".mypage.mypick.main";
	}
	
}
