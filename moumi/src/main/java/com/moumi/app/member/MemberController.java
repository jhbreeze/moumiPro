package com.moumi.app.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("member.memberController")
@RequestMapping(value="/member/*")
public class MemberController {
	@RequestMapping(value = "member")
	public String memberForm(Model model) {
		model.addAttribute("mode", "member");
		return ".member.member";
	}
	
}
