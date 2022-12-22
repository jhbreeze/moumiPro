package com.moumi.app.admin.event;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller("admin.event.eventController")
@RequestMapping("/admin/event/*")
public class EventController {
	@Autowired
	private EventService service;


	@RequestMapping(value = "list")
	public String list() throws Exception {

		return ".admin.event.list";
	}

	@GetMapping("write")
	public String writeForm(Model model) throws Exception {

		model.addAttribute("mode", "write");

		return ".admin.event.write";
	}

	@PostMapping("write")
	public String writeSubmit(Event dto, HttpSession session, Model model) throws Exception {
		//SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			
			System.out.print("write");

			dto.setUserCode(0);
			service.insertEvent(dto, "write");
		} catch (Exception e) {
		}

		return "redirect:/admin/event/list";

	}

	@GetMapping("article")
	public String article() throws Exception {

		return ".admin.event.article";
	}

	

}
