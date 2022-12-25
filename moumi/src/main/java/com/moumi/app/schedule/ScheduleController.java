package com.moumi.app.schedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller("sch.scheduleController")
@RequestMapping("/schedule/*")
public class ScheduleController {
	@Autowired
	private ScheduleService service;
	
	@RequestMapping(value = "main")
	public ModelAndView main(
			HttpSession session) throws Exception {
		//SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userCode", 1);
		//List<Schedule> listCategory = service.listCategory(map);
		
		ModelAndView mav = new ModelAndView(".sch.main");
		//mav.addObject("listCategory", listCategory);
		return mav;
	}
	
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(@ModelAttribute(value = "dto") Schedule dto,
			HttpSession session,
			Model model) throws Exception {
		//SessionInfo info = (SessionInfo)session.getAttribute("member");

		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("userId", info.getUserId());
		///List<Schedule> listCategory = service.listCategory(map);
		
		model.addAttribute("mode", "write");
		//model.addAttribute("listCategory", listCategory);
		
		return ".sch.write";
	}
	
	
}


