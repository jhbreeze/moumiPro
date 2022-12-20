package com.moumi.app.qna;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("qna.qnaController")
@RequestMapping("/qna/*")
public class QnaController {

	@RequestMapping(value = "main")
	public String main(HttpServletRequest req,Model model) {
		return ".qna.main";
	}
	
	@RequestMapping(value = "list")
	public String list(HttpServletRequest req,Model model) {
		return "qna/list";
	}
}
