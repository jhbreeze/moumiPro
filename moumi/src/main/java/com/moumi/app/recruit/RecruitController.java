package com.moumi.app.recruit;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("recruit.recruitController")
@RequestMapping("/recruit/*")
public class RecruitController {
	
		
	@RequestMapping(value = "list")
	public String list() throws Exception {
		
		return ".recruit.list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		 
		model.addAttribute("mode", "write");
		
		return ".recruit.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Recruit dto, HttpSession session) throws Exception {
		
		try {
			//service.insertRecruit(dto, pathname);
		} catch (Exception e) {
		}
		
		
		return "redirect:/recruit/list";
	}
	
	@GetMapping("article")
	public String article() throws Exception {
		
		return ".recruit.article";
	}
	
	
}
