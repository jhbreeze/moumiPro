package com.moumi.app.admin.notice;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.moumi.app.common.FileManager;
import com.moumi.app.common.MyUtil;
import com.moumi.app.member.SessionInfo;

@Controller("admin.notice.noticeController")
@RequestMapping("/admin/notice/*")
public class NoticeController {
	@Autowired
	private NoticeService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	//@RequestMapping("list")
	//public String noticeManage() {
	//	return ".admin.notice.list";
	//}
	
	@RequestMapping("list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model) throws Exception{
		
		int size = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Notice> list = service.listNotice(map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/admin/notice/list";
		String articleUrl = cp + "/admin/notice/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if (query.length() != 0) {
			listUrl = cp + "/admin/notice/list?" + query;
			articleUrl = cp + "/admin/notice/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".admin.notice.list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model, HttpSession session) throws Exception {
		
		model.addAttribute("mode", "write");
		return ".admin.notice.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Notice dto, HttpSession session) throws Exception {
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads"+File.separator+"notice";
			
			dto.setUserCode(0);
			service.insertNotice(dto, pathname);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:/admin/notice/list";
	}
	
	@RequestMapping("article")
	public String article(@RequestParam long noticeNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition, 
			@RequestParam(defaultValue = "") String keyword,
			Model model) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page="+page;
		if(keyword.length() != 0) {
			query += "&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		service.updateHitCount(noticeNum);
		
		Notice dto = service.readNotice(noticeNum);
		if(dto == null) {
			return "redirect:/admin/notice/list?"+query;
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("noticeNum",noticeNum);
		
		Notice preReadDto = service.preReadNotice(map);
		Notice nextReadDto = service.nextReadNotice(map);
		
		List<Notice> listFile = service.listFile(noticeNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".admin.notice.article";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long noticeNum,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		Notice dto = service.readNotice(noticeNum);
		
		List<Notice> listFile = service.listFile(noticeNum);
		
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		
		return ".admin.notice.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(Notice dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "notice";
			
			dto.setUserCode(0);
			service.updateNotice(dto, pathname);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/admin/notice/list?page="+page;
	}
	
	@RequestMapping("delete")
	public String delete(@RequestParam long noticeNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page="+page;
		if(keyword.length() != 0) {
			query += "&condtion="+condition+"&keyword"+URLEncoder.encode(keyword, "UTF-8");
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads"+File.separator+"notice";
			service.deleteNotice(noticeNum, pathname);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:/admin/notice/list?" + query;
	}
	
	@PostMapping("deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long noticeFileNum, HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator+"notice";
		
		Notice dto = service.readFile(noticeFileNum);
		if(dto != null) {
			fileManager.doFileDelete(dto.getImageFilename(), pathname);
		}
		
		String state = "false";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "noticeFileNum");
			map.put("noticeFileNum", noticeFileNum);
			service.deleteFile(map);
			state = "true";
		} catch (Exception e) {
			// TODO: handle exception
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	

}
