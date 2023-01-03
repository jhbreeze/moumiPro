package com.moumi.app.mypage.mypayment;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mypage.mypaymentController")
@RequestMapping("/mypage/mypayment/*")
public class MypaymentController {
	
	@RequestMapping(value = "main")
	public String Main(Model model) throws Exception {
		
		
		return ".mypage.mypayment.main";
	}
	
	
}
