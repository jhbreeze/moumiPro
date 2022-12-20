package com.moumi.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("board.boardController")
@RequestMapping("/board/*")
public class BoardController {

	
	@RequestMapping(value = "list")
	public String list(HttpServletRequest req,Model model) {
		return ".board.list";
	}
	@GetMapping("write")
	public String writeForm(Model model) {
		model.addAttribute("mode","write");
		
		return ".board.write";
	}
	@PostMapping("write")
	public String writeSubmit(Board dto,HttpSession session) throws Exception {
		return "redirect:board/list";
	}
	
	@GetMapping("article")
	public String article(HttpSession session, Model model) {
		return ".board.article";
	}
	

	
	
}
