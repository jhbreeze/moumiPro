package com.moumi.app.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("event.eventController")
@RequestMapping("/event/*")
public class EventController {
	@Autowired
	private EventService service;

	@RequestMapping(value = "list")
	public String list(Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<Event> list = service.listEvent(map);
		model.addAttribute("list", list);

		return ".event.list";
	}

	@GetMapping("article")
	public String article(@RequestParam long eventNum, Model model) throws Exception {

		try {

			// 이벤트 게시글 가져오기
			Event dto = service.readEvent(eventNum);
			model.addAttribute("dto", dto);

		} catch (Exception e) {

		}
		return ".event.article";
	}

}
