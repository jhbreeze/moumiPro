package com.moumi.app.admin.faq;

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

import com.moumi.app.common.MyUtil;
import com.moumi.app.member.SessionInfo;

@Controller("admin.faq.faqController")
@RequestMapping("/admin/faq/*")
public class FaqController {
	@Autowired
	private FaqSevice service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("main")
	public String main(@RequestParam(value = "pageNo", defaultValue = "1")int current_page,
			Model model, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getUserType() != 0) {
			return "redirect:/main";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Faq> listCategory = service.listCategory(map);
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("categoryNum", "0");
		model.addAttribute("pageNo", current_page);
		
		return ".admin.faq.main";
	}
	
	@RequestMapping("list")
	public String list(@RequestParam(value = "pageNo", defaultValue = "1")int current_page,
			HttpServletRequest req,
			@RequestParam(defaultValue = "0") int categoryNum,
			Model model, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getUserType() != 0) {
			return "redirect:/main";
		}
		
		int size = 5;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNum", categoryNum);
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1)*size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Faq>list = service.listFaq(map);
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		model.addAttribute("categoryNum", categoryNum);
		
		return "admin/faq/list";
	}
	
	
	@GetMapping("write")
	public String writeForm(Model model, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getUserCode() != 1) {
			return "redirect:/faq/list";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		List<Faq> listCategory = service.listCategory(map);
		
		model.addAttribute("mode", "write");
		model.addAttribute("pageNo", "1");
		model.addAttribute("listCategory", listCategory);
		
		return ".admin.faq.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Faq dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getUserType() != 0) {
			return "redirect:/main";
		}
		try {
			if(info.getUserCode() == 1) {
				dto.setUserCode(info.getUserCode());
				service.insertFaq(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/admin/faq/main?pageNo=1";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long faqNum,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getUserType() != 0) {
			return "redirect:/main";
		}
		
		Faq dto = service.readFaq(faqNum);
		if (dto == null) {
			return "redirect:/admin/faq/list";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Faq> listCategory = service.listCategory(map);
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("listCategory", listCategory);
		
		return ".admin.faq.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(Faq dto, 
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getUserType() != 0) {
			return "redirect:/main";
		}
		
		try {
			service.updateFaq(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/admin/faq/main";
	}
	
	@PostMapping("deleteList")
	public String deleteList(@RequestParam List<Long> faqNums, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getUserType() != 0) {
			return "redirect:/main";
		}
		
		try {
			service.deleteFaq(faqNums);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return "redirect:/admin/faq/main";
	}

}
