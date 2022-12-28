package com.moumi.app.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moumi.app.common.MyUtil;

@Controller(".notice.Controller")
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "main")
	public String main(HttpServletRequest req,Model model) {
		return ".notice.main";
	}
	// AJAX-Text(HTML)
		@RequestMapping(value = "list")
		public String list(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
				HttpServletRequest req,
				Model model) throws Exception {

			int size = 10;
			int total_page = 0;
			int dataCount = 0;


			Map<String, Object> map = new HashMap<String, Object>();
			dataCount = service.dataCount(map);
			if (dataCount != 0) {
				total_page = myUtil.pageCount(dataCount, size);
			}

			if (total_page < current_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);

			List<Notice> list = service.listNotice(map);
			
			  for (Notice dto : list) {
				  dto.setContent(myUtil.htmlSymbols(dto.getContent()));
			  }
			 

			String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

			model.addAttribute("list", list);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);

			return "notice/list";
		}
	
}
