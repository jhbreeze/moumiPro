package com.moumi.app.admin.event;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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

import com.moumi.app.common.MyUtil;

@Controller("admin.event.eventController")
@RequestMapping("/admin/event/*")
public class EventController {
	@Autowired
	private EventService service;

	@Autowired
	@Qualifier("myUtil")
	private MyUtil myUtil;

	@RequestMapping(value = "list")
	public String list(@RequestParam(defaultValue = "0") long eventNum,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req, Model model) throws Exception {

		int size = 6;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);

		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		List<Event> list = service.listEvent(map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/admin/event/list";
		String articleUrl = cp + "/admin/event/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/admin/event/list?" + query;
			articleUrl = cp + "/admin/event/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("eventNum", eventNum);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".admin.event.list";
	}

	@GetMapping("write")
	public String writeForm(Model model) throws Exception {

		model.addAttribute("mode", "write");

		return ".admin.event.write";
	}

	@PostMapping("write")
	public String writeSubmit(Event dto, HttpSession session, Model model) throws Exception {
		// SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {

			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads" + File.separator + "event";

			dto.setUserCode(1);
			service.insertEvent(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/admin/event/list";

	}

	@GetMapping("update")
	public String updateForm(@RequestParam long eventNum, Model model) throws Exception {

		try {

			Calendar cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			Event dto = service.readEvent(eventNum);
			// String s = dto.getEday().replaceAll("\\-|\\.|/", "");
			String s = dto.getStartDate().replaceAll("\\-|\\.|/", "");
			String e = dto.getEndDate().replaceAll("\\-|\\.|/", "");

			int sy = Integer.parseInt(s.substring(0, 4));
			int sm = Integer.parseInt(s.substring(4, 6));
			int sd = Integer.parseInt(s.substring(6));

			cal.set(sy, sm - 1, sd + 1);
			cal.add(Calendar.DATE, -1);

			dto.setStartDate(sdf.format(cal.getTime()));

			int ey = Integer.parseInt(e.substring(0, 4));
			int em = Integer.parseInt(e.substring(4, 6));
			int ed = Integer.parseInt(e.substring(6));

			cal.set(ey, em - 1, ed + 1);

			cal.add(Calendar.DATE, -1);

			dto.setEndDate(sdf.format(cal.getTime()));
			model.addAttribute("dto", dto);
			model.addAttribute("mode", "update");

		} catch (Exception e) {
			e.printStackTrace();

		}

		return ".admin.event.write";
	}

	@PostMapping("update")
	public String updateSubmit(Event dto, HttpSession session) throws Exception {
		// SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {

			System.out.println("후 ..... ");
			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads" + File.separator + "event";

			service.updateEvent(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/admin/event/list";

	}

	@GetMapping("article")
	public String article(@RequestParam long eventNum, Model model) throws Exception {

		try {

			// 이벤트 게시글 가져오기
			Event dto = service.readEvent(eventNum);
			model.addAttribute("dto", dto);

		} catch (Exception e) {

		}
		return ".admin.event.article";
	}

	@RequestMapping("delete")
	public String delete(@RequestParam long eventNum, HttpSession session) throws Exception {

		try {
			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads" + File.separator + "event";
			service.deleteEvent(eventNum, path);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "redirect:/admin/event/list";

	}

}
