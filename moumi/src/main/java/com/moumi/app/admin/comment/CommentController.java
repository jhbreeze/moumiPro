package com.moumi.app.admin.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moumi.app.common.MyUtil;
import com.moumi.app.member.SessionInfo;

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
		
		model.addAttribute("status", "0");
		model.addAttribute("pageNo", current_page);
		
		return ".admin.comment.main";
	}
	
	@RequestMapping("list")
	public String list(@RequestParam(value = "pageNo", defaultValue = "1")int current_page,
			@RequestParam(defaultValue = "0")int status,
			HttpServletRequest req,
			Model model, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getUserType() != 0) {
			return "redirect:/main";
		}
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		List<Comment> list = service.listComment(map);
		String cp = req.getContextPath();
		String query = "";
		String articleUrl = cp + "/board/article?pageNo=" + current_page;
		
		if (query.length() != 0) {
			articleUrl = cp + "/board/article?pageNo=" + current_page + "&" + query;
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("status", status);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("dataCount", dataCount);

		return "admin/comment/list";
	}
	
	@PostMapping("update")
	@ResponseBody
	public Map<String, Object> update(@RequestParam long replyNum, 
			 @RequestParam int status, HttpSession session) throws Exception {
		
		String state = "false";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("replyNum", replyNum);
			map.put("status", status);
			
			service.updateComment(map);
			state = "true";
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

}
