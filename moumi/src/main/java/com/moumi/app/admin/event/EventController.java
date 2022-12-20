package com.moumi.app.admin.event;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("admin.event.eventController")
@RequestMapping("/admin/event/*")
public class EventController {

	@RequestMapping(value = "list")
	public String list() throws Exception {

		return ".admin.event.list";
	}

	@GetMapping("write")
	public String writeForm(Model model) throws Exception {

		model.addAttribute("mode", "write");

		return ".event.write";
	}

	@PostMapping("write")
	public String writeSubmit(Event dto, HttpSession session) throws Exception {

		try {

		} catch (Exception e) {
		}

		return "redirect:/recruit/list";
	}

	@GetMapping("article")
	public String article() throws Exception {

		return ".event.article";
	}

}
