package com.moumi.app.faqu;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("faqu.faquController")
@RequestMapping("/faqu/*")
public class FaquController {

	@RequestMapping(value = "list")
	public String list(HttpServletRequest req,Model model) {
		return ".faqu.list";
	}
}
