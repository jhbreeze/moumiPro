package com.moumi.app.notice;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moumi.app.admin.notice.Notice;
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
				@RequestParam(defaultValue = "all") String condition,
				@RequestParam(defaultValue = "") String keyword,
				HttpServletRequest req,
				Model model) throws Exception {

			int size = 10;
			int total_page = 0;
			int dataCount = 0;

			if (req.getMethod().equalsIgnoreCase("GET")) {
				keyword = URLDecoder.decode(keyword, "utf-8");
			}

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("condition", condition);
			map.put("keyword", keyword);

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
			
			String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

			model.addAttribute("list", list);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);

			model.addAttribute("condition", condition);
			model.addAttribute("keyword", keyword);

			return "notice/list";
		}
	
}
