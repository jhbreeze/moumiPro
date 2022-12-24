package com.moumi.app.board;

import java.io.File;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moumi.app.common.FileManager;
import com.moumi.app.common.MyUtil;
import com.moumi.app.member.SessionInfo;

@Controller("board.boardController")
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value="page",defaultValue = "1") int current_page,
				@RequestParam(defaultValue = "all") String condition,
				@RequestParam(defaultValue = "") String keyword,HttpServletRequest req,Model model
				, HttpSession session,Board dto) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setNickName("관리자");
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword ,"utf-8");
		}
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page-1) * size;
		if(offset<0) offset = 0;
		
		map.put("offset", offset);
		map.put("size",size);
		
		List<Board> list = service.listBoard(map);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".board.list";
	}
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		model.addAttribute("mode","write");
		
		return ".board.write";
	}
	@PostMapping("write")
	public String writeSubmit(Board dto,HttpSession session,HttpServletRequest req) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator+"board";
		
		  if(req.getParameter("category").equals("fashion")) {
			  dto.setBrandNum(1); 
		  }
		  else if(req.getParameter("category").equals("food")) {
			  dto.setBrandNum(2); 
		  }
		  else if(req.getParameter("category").equals("electronic")) {
			  dto.setBrandNum(3); 
		  } else if(req.getParameter("category").equals("car")) {
			  dto.setBrandNum(4); 
		  } else if(req.getParameter("category").equals("cosmetic")) {
			  dto.setBrandNum(5); 
	      } else if(req.getParameter("category").equals("furniture")) {
	    	  dto.setBrandNum(6); 
	      }
		
		try {
			//dto.setNickName(info.getUserNickName());
			// dto.setUserCode(info.getUserCode());
			dto.setUserCode(1);
			dto.setNickName("관리자");

			 
			service.insertBoard(dto, pathname);
		} catch (Exception e) {
		}
		return "redirect:/board/list";
	}
	
	@GetMapping("article")
	public String article(HttpSession session, Model model) {
		return ".board.article";
	}
	

	
	
}
