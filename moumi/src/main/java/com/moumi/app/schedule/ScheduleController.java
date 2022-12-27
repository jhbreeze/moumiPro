package com.moumi.app.schedule;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller("sch.scheduleController")
@RequestMapping("/schedule/*")
public class ScheduleController {
	@Autowired
	private ScheduleService service;

	@RequestMapping(value = "main")
	public ModelAndView main(HttpSession session) throws Exception {
		// SessionInfo info = (SessionInfo)session.getAttribute("member");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userCode", 1);
		// List<Schedule> listCategory = service.listCategory(map);

		ModelAndView mav = new ModelAndView(".sch.main");
		// mav.addObject("listCategory", listCategory);
		return mav;
	}

	@GetMapping("write")
	public String writeForm(@ModelAttribute(value = "dto") Schedule dto, HttpSession session, Model model)
			throws Exception {
		// SessionInfo info = (SessionInfo)session.getAttribute("member");

		Map<String, Object> map = new HashMap<String, Object>();
		// map.put("userId", info.getUserId());
		/// List<Schedule> listCategory = service.listCategory(map);

		model.addAttribute("mode", "write");
		// model.addAttribute("listCategory", listCategory);

		return ".sch.write";
	}

	@PostMapping("write")
	public String writeSubmit(Schedule dto, HttpSession session) throws Exception {
		// SessionInfo info=(SessionInfo)session.getAttribute("member");

		try {
			dto.setUserCode(1);
			System.out.println("insert 전");
			service.insertSchedule(dto);
			System.out.println("insert 후");


		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/schedule/main";
	}

	
	// 월별 일정 - AJAX : JSON 
	@RequestMapping(value="month")
	@ResponseBody
	public Map<String, Object> month (
			@RequestParam String start,
			@RequestParam String end,
			@RequestParam(required = false) List<Integer> categorys,
			HttpSession session) throws Exception {
		//SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("categoryList", categorys);
		map.put("start", start);
		map.put("end", end);
		//map.put("userCode", info.getUserId());
		map.put("userCode", 1);
		
		List<Schedule> list=service.listMonth(map);
		for(Schedule dto:list) {
	    	if(dto.getStime()==null) {
	    		dto.setAllDay(true);
	    	} else {
	    		dto.setAllDay(false);
	    	}
	    	
	    	if(dto.getStime()!=null && dto.getStime().length()!=0) {
	    		// 2021-10-10T10:10
	    		dto.setStart(dto.getSday()+"T" + dto.getStime());
	    	} else {
	    		dto.setStart(dto.getSday());
	    	}
	    	
	    	if(dto.getEtime()!=null && dto.getEtime().length()!=0) {
	    		dto.setEnd(dto.getEday()+"T" + dto.getEtime());
	    	} else {
	    		dto.setEnd(dto.getEday());
	    	}
	    	
	    	if(dto.getRepeat()!=0) { // 반복 일정인 경우
	    		if( dto.getStart().substring(0,4).compareTo(start.substring(0,4)) != 0 ) {
	    			dto.setStart(start.substring(0,4)+dto.getStart().substring(5));
	    		}
	    	}	    	
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("list", list);
		return model;
	}
	
	@GetMapping(value = "update")
	public String updateForm(@RequestParam int num,
			HttpSession session,
			Model model) throws Exception {
		//SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		System.out.println("update Num"+num);
		Schedule dto = service.readSchedule(num);
		if(dto == null) {
			return "redirect:/schedule/main";
		}
		
		if(dto.getStime() == null) {
			dto.setAll_day("1");
			try {
				String s = dto.getEday().replaceAll("\\-|\\.|/", "");

				int y = Integer.parseInt(s.substring(0, 4));
				int m = Integer.parseInt(s.substring(4, 6));
				int d = Integer.parseInt(s.substring(6));

				Calendar cal = Calendar.getInstance();
				cal.set(y, m - 1, d);

				cal.add(Calendar.DATE, -1);

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				dto.setEday( sdf.format(cal.getTime()) );
			} catch (Exception e) {
			}
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userCode", 1);
		//map.put("userCode", info.getUserId());
		
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		
		return ".sch.write";
	}
	
	@PostMapping(value = "update")
	public String updateSubmit(Schedule dto,
			HttpSession session) throws Exception {
		//SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			
			dto.setUserCode(1);
			service.updateSchedule(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/schedule/main";
	}

	
}