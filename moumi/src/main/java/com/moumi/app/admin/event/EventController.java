package com.moumi.app.admin.event;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public String list(Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<Event> list = service.listEvent(map);
		model.addAttribute("list", list);

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
			
			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads" + File.separator + "event";
			
			dto.setUserCode(0);
			service.insertEvent(dto, path);
		} catch (Exception e) {
		}

		return "redirect:/admin/event/list";

	}

	@GetMapping("article")
	public String article() throws Exception {

		return ".admin.event.article";
	}

	

}
