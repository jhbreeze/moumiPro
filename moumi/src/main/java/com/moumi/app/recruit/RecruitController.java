package com.moumi.app.recruit;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

@Controller("recruit.recruitController")
@RequestMapping("/recruit/*")
public class RecruitController {
	@Autowired
	private RecruitService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
		
	@RequestMapping(value = "main")
	public String main(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		model.addAttribute("page", current_page);
		
		return ".recruit.main";
	}
	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword, 
			HttpServletRequest req, Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if (offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Recruit> list = service.listRecruit(map);
		for(Recruit dto : list) {
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "recruit/list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		List<Recruit> listCategory = service.listCareerCategory(); 
		
		model.addAttribute("page", "1"); // ?
		model.addAttribute("mode", "write");
		model.addAttribute("listCategory", listCategory);
		
		return ".recruit.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Recruit dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "recruit";

			dto.setUserCode(info.getUserCode()); // user 코드(회원코드 시퀀스) 
			dto.setUserType(info.getUserType());
			
			service.insertRecruit(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/recruit/main?page=1";
	}
	
	@GetMapping("article")
	public String article(@RequestParam long recruitNum, @RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + 
					"&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		Recruit dto = service.readRecruit(recruitNum);
		if (dto == null) {
			return "redirect:/recruit/main?" + query;
		}
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("recruitNum", recruitNum);

		Recruit preReadDto = service.preReadRecruit(map);
		Recruit nextReadDto = service.nextReadRecruit(map);

		// 게시글 좋아요 여부
		//map.put("userId", info.getUserId());
		//boolean userBoardLiked = service.userBoardLiked(map);

		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);

		//model.addAttribute("userBoardLiked", userBoardLiked);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".recruit.article";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long recruitNum,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Recruit dto = service.readRecruit(recruitNum);
		// 회원코드 타입 처리
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		
		return ".recruit.write";
		
	}
	
	@PostMapping("update")
	public String updateSubmit(Recruit dto, @RequestParam String page,
			HttpSession session) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "recruit";
		
		try {
			service.updateRecruit(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/recruit/main?page=" + page;
	}
	
	@RequestMapping(value = "deleteFile")
	public String deleteFile(@RequestParam long recruitNum,
			@RequestParam String page,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "recruit";

		Recruit dto = service.readRecruit(recruitNum);
		if (dto == null) {
			return "redirect:/recruit/main?page=" + page;
		}
		
		// 코드, 타입 처리
		
		try {
			if (dto.getImageFilename()!= null) {
				fileManager.doFileDelete(dto.getImageFilename(), pathname); // 실제파일삭제
				dto.setImageFilename("");
				
				service.updateRecruit(dto, pathname);
			}
		} catch (Exception e) {
		}

		return "redirect:/recruit/update?num=" + recruitNum + "&page=" + page;
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam long recruitNum,
			@RequestParam String page, 
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "bbs";

		//service.deleteRecruit(num, pathname, userId, userCode);
		return "redirect:/recruit/main?" + query;
		
	}
}
