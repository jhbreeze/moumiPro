package com.moumi.app.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mypage.mypageController")
@RequestMapping("/mypage/*")
public class MypageController {
	
	@RequestMapping(value = "mypayment/main")
	public String mypaymentMain(Model model) throws Exception {
		
		
		return ".mypage.mypayment.main";
	}
	
	@RequestMapping(value = "myhistory/main")
	public String myhistoryMain(Model model) throws Exception {
		
		
		return ".mypage.myhistory.main";
	}
	
	@RequestMapping(value = "mypick/main")
	public String mypickMain(Model model) throws Exception {
		
		
		return ".mypage.mypick.main";
	}
	
}
