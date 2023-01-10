package com.moumi.app.mypage.mypayment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moumi.app.common.MyUtil;
import com.moumi.app.member.SessionInfo;

@Controller("mypage.mypaymentController")
@RequestMapping("/mypage/mypayment/*")
public class MypaymentController {
	@Autowired
	private MypaymentService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "main")
	public String Main(Model model) throws Exception {
		
		return ".mypage.mypayment.main";
	}
	
	@RequestMapping(value = "current")
	public String current(@RequestParam(defaultValue = "1") int div,
			HttpSession session,
			HttpServletRequest req, 
			Model model) throws Exception {
		
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userCode", info.getUserCode());
		map.put("div", div);
		
		List<Mypayment> current = service.listMypaymentCurrent(map);
		
		
		model.addAttribute("current", current);
		
		
		return "mypage/mypayment/current";
	}
	
	@RequestMapping(value = "detail")
	public String detail(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "1") int div,
			HttpSession session,
			HttpServletRequest req, 
			Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCountR = 0;
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userCode", info.getUserCode());
		map.put("div", div);
		
		dataCountR = service.dataCountR(map);
		if (dataCountR != 0) {
			total_page = myUtil.pageCount(dataCountR, size);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if (offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		
		List<Mypayment> detail = service.listMypaymentDetail(map);
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("detail", detail);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCountR", dataCountR);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		
		return "mypage/mypayment/detail";
	}
	
	
	
	
}
