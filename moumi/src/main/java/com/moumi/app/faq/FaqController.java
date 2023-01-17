package com.moumi.app.faq;

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

import com.moumi.app.admin.faq.Faq;

@Controller("faq.faqUController")
@RequestMapping("/faq/*")
public class FaqController {
	
	@Autowired
	private FaqService service;
	
	@RequestMapping(value = "main")
	public String main(Model model) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mode", "enabled");
		List<Faq> listCategory = service.listCategory(map);
		
		model.addAttribute("listCategory",listCategory);
		model.addAttribute("categoryNum","0");
		
		return ".faq.main";
	}
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "0") int categoryNum,
			HttpServletRequest req,
			Model model) throws Exception {

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("categoryNum", categoryNum);

		List<Faq> list = service.listFaq(map);


		model.addAttribute("list", list);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("categoryNum", categoryNum);

		return "faq/list";
	}
}
