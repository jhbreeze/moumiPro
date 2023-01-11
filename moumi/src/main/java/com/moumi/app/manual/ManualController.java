package com.moumi.app.manual;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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

@Controller("manual.manualController")

@RequestMapping("/manual/*")
public class ManualController {
	@Autowired
	private ManualService service;
	
	@Autowired
	@Qualifier("myUtil")
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping("list")
	public String manualManage(@RequestParam(defaultValue = "0") long manualNum,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model, HttpSession session) throws Exception{
		
		
		int size = 6;
		int total_page;
		int dataCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Manual> list = service.listManual(map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/manual/list";
		String articleUrl = cp + "/manual/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/manual/list?" + query;
			articleUrl = cp + "/manual/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("manualNum", manualNum);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".manual.list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getUserType() != 0) {
			return "redirect:/main";
		}
		
		model.addAttribute("mode", "write");
		
		return ".manual.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Manual dto, 
			HttpSession session, 
			Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getUserType() != 0) {
			return "redirect:/main";
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads"+File.separator+"manual";
			
			dto.setUserCode(info.getUserCode());
			service.insertManual(dto, path);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:/manual/list";
	}
	
	@RequestMapping("article")
	public String article(@RequestParam long manualNum, 
			@RequestParam String page, 
			@RequestParam(defaultValue = "all")String condition, 
			@RequestParam(defaultValue = "")String keyword,
			Model model, HttpSession session) throws Exception {
		
		
		try {
			keyword = URLDecoder.decode(keyword, "utf-8");

			String query = "page=" + page;
			if (keyword.length() != 0) {
				query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
			}
			
			Manual dto = service.readManual(manualNum);
			if(dto == null) {
				return "redirect:/manual/list";
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("condition", condition);
			map.put("keyword", keyword);
			map.put("manualNum", manualNum);
			
			Manual preReadDto = service.preReadManual(map);
			Manual nextReadDto = service.nextReadManual(map);
			
			List<Manual> listFile = service.listManualFile(manualNum);
			
			model.addAttribute("dto", dto);
			model.addAttribute("listFile", listFile);
			model.addAttribute("preReadDto", preReadDto);
			model.addAttribute("nextReadDto", nextReadDto);
			model.addAttribute("page", page);
			model.addAttribute("query", query);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return ".manual.article";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long manualNum, 
			@RequestParam String page, 
			HttpSession session, 
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getUserType() != 0) {
			return "redirect:/main";
		}
		Manual dto = service.readManual(manualNum);
		List<Manual> listFile = service.listManualFile(manualNum);
		
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		
		
		return ".manual.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(Manual dto, 
			@RequestParam String page, 
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getUserType() != 0) {
			return "redirect:/main";
		}

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "manual";
			
			dto.setUserCode(info.getUserCode());
			service.updateManual(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/manual/list?page="+page;
	}
	
	@RequestMapping("delete")
	public String delete(@RequestParam long manualNum, 
			@RequestParam String page, 
			@RequestParam(defaultValue = "all") String condition, 
			@RequestParam(defaultValue = "") String keyword, 
			HttpSession session) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page="+page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "manual";
			service.deleteManual(manualNum, pathname);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/manual/list?"+query;
	}
	
	@RequestMapping("deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long fileNum, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "manual";
		
		Manual dto = service.readManual(fileNum);
		if(dto != null) {
			fileManager.doFileDelete(dto.getImageFilename(), pathname);
		}
		
		String state = "false";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "fileNum");
			map.put("num", fileNum);
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
