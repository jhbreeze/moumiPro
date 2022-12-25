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
	
	@RequestMapping("list")
	public String faqManage(@RequestParam(value = "page", defaultValue = "1")int current_page1,
			@RequestParam(value = "page", defaultValue = "1")int current_page2,
			@RequestParam(value = "page", defaultValue = "1")int current_page3,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int size = 5;
		int total_page1 = 0;
		int total_page2 = 0;
		int total_page3 = 0;
		
		int dataCount1 = 0;
		int dataCount2 = 0;
		int dataCount3 = 0;
		int categoryNum = 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNum", categoryNum);
		
		dataCount1 = service.dataCount1(map);
		if(dataCount1 != 0) {
			total_page1 = myUtil.pageCount(dataCount1, size);
		}
		
		dataCount2 = service.dataCount2(map);
		if(dataCount2 != 0) {
			total_page2 = myUtil.pageCount(dataCount2, size);
		}
		
		dataCount3 = service.dataCount3(map);
		if(dataCount3 != 0) {
			total_page3 = myUtil.pageCount(dataCount3, size);
		}
		
		if(total_page1 < current_page1) {
			current_page1 = total_page1;
		}
		
		if(total_page2 < current_page2) {
			current_page2 = total_page2;
		}
		
		if(total_page3 < current_page3) {
			current_page3 = total_page3;
		}
		
		int offset1 = (current_page1 - 1)* size;
		if(offset1 < 0) offset1 = 0;
		
		int offset2 = (current_page2 - 1)* size;
		if(offset2 < 0) offset2 = 0;
		
		int offset3 = (current_page3 - 1)* size;
		if(offset3 < 0) offset3 = 0;
		
		map.put("offset1", offset1);
		map.put("offset2", offset2);
		map.put("offset3", offset3);
		map.put("size", size);
		
		List<Faq> list1 = service.listFaq1(map);
		List<Faq> list2 = service.listFaq2(map);
		List<Faq> list3 = service.listFaq3(map);
		String cp = req.getContextPath();
		String listUrl1 = cp + "/admin/faq/list";
		String listUrl2 = cp + "/admin/faq/list";
		String listUrl3 = cp + "/admin/faq/list";
		
		String paging1 = myUtil.pagingMethod(current_page1, total_page1, "listPage");
		
		String paging2 = myUtil.pagingMethod(current_page2, total_page2, "listPage");
		
		String paging3 = myUtil.pagingMethod(current_page3, total_page3, "listPage");
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("page1", current_page1);
		model.addAttribute("page2", current_page2);
		model.addAttribute("page3", current_page3);
		model.addAttribute("dataCount1", dataCount1);
		model.addAttribute("dataCount2", dataCount2);
		model.addAttribute("dataCount3", dataCount3);
		model.addAttribute("size",size);
		model.addAttribute("total_page1",total_page1);
		model.addAttribute("total_page2",total_page2);
		model.addAttribute("total_page3",total_page3);
		model.addAttribute("paging1",paging1);
		model.addAttribute("paging2",paging2);
		model.addAttribute("paging3",paging3);
		
		return ".admin.faq.list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getUserCode() != 1) {
			return "redirect:/faq/list";
		}
		
		model.addAttribute("mode", "write");
		
		return ".admin.faq.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Faq dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			if(info.getUserCode() == 1) {
				dto.setUserCode(info.getUserCode());
				service.insertFaq(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/admin/faq/list";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long faqNum, 
			@RequestParam String page1, 
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Faq dto = service.readFaq(faqNum);
		if (dto == null) {
			return "redirect:/admin/faq/list?page1="+page1;
		}
		
		model.addAttribute("mode", "update");
		model.addAttribute("page1", page1);
		model.addAttribute("dto", dto);
		return ".admin.faq.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(Faq dto, 
			@RequestParam String page1, 
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			dto.setUserCode(info.getUserCode());
			service.updateFaq(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/admin/faq/list?page1="+page1;
	}
	
	@PostMapping("deleteList")
	public String deleteList(@RequestParam List<Long> faqNums) throws Exception {
		try {
			service.deleteFaq(faqNums);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return "redirect:/admin/faq/list";
	}

}
