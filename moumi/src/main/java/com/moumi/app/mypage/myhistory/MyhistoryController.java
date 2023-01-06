package com.moumi.app.mypage.myhistory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moumi.app.common.MyUtil;
import com.moumi.app.member.SessionInfo;

@Controller("mypage.myhistoryController")
@RequestMapping("/mypage/myhistory/*")
public class MyhistoryController {
	@Autowired
	private MyhistoryService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "main")
	public String Main(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpServletRequest req, Model model) throws Exception {
		
		model.addAttribute("pageNo", current_page);
		
		return ".mypage.myhistory.main";
	}

	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "1") int div,
			HttpSession session,
			HttpServletRequest req, 
			Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userCode", info.getUserCode());
		map.put("div", div);
		
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if (offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		
		
		List<Myhistory> list = service.listMyhistoryPost(map);
		for(Myhistory dto : list) {
			dto.setSubject(myUtil.htmlSymbols(dto.getSubject()));
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		
		return ".mypage.myhistory.list";
	}
}
