package com.moumi.app.pay;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("pay.payController")
@RequestMapping("/pay/*")
public class PayController {

	@RequestMapping(value = "list")
	public String list(HttpSession sesion) {
		return ".pay.list";
	}
}
