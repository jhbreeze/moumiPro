package com.moumi.app.admin.comment;

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

@Controller("admin.comment.commentController")

@RequestMapping("/admin/comment/*")
public class CommentController {
	@Autowired
	private CommentService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("main")
	public String main(@RequestParam(value = "pageNo", defaultValue = "1") int current_page, 
			Model model) throws Exception {
		
		model.addAttribute("reply", "0");
		model.addAttribute("pageNo", current_page);
		
		return ".admin.comment.main";
	}
	
	@RequestMapping("list")
	public String list(@RequestParam(value = "pageNo", defaultValue = "1")int current_page,
			@RequestParam(defaultValue = "0")int reply,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reply", reply);
		
		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		List<Comment> list = service.listComment(map);
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("reply", reply);

		return "admin/comment/list";
	}

}
