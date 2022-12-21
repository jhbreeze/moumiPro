package com.moumi.app.recruit;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moumi.app.common.MyUtil;

@Controller("recruit.recruitController")
@RequestMapping("/recruit/*")
public class RecruitController {
	@Autowired
	private RecruitService service;
	
	@Autowired
	private MyUtil myUtil;
		
	@RequestMapping(value = "list")
	public String list() throws Exception {
		
		return ".recruit.list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		List<Recruit> listCategory = service.listCareerCategory(); 
		
		model.addAttribute("mode", "write");
		model.addAttribute("listCategory", listCategory);
		
		return ".recruit.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Recruit dto, HttpSession session) throws Exception {
		// SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
		//	dto.setUserCode(info.getuserCode());
			service.insertRecruit(dto, "write");
		} catch (Exception e) {
		}
		
		
		return "redirect:/recruit/list";
	}
	
	@GetMapping("article")
	public String article() throws Exception {
		
		return ".recruit.article";
	}
	
	
}
