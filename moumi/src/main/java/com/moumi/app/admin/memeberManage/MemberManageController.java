package com.moumi.app.admin.memeberManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.memberManageController")
public class MemberManageController {
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String method() {
		return ".adminLayout";
	}

}
