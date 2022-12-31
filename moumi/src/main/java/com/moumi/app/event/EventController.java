package com.moumi.app.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moumi.app.common.MyUtil;
import com.moumi.app.member.SessionInfo;

@Controller("event.eventController")
@RequestMapping("/event/*")
public class EventController {
	@Autowired
	private EventService service;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "list")
	public String list(Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<Event> list = service.listEvent(map);
		model.addAttribute("list", list);

		return ".event.list";
	}

	@GetMapping("article")
	public String article(@RequestParam long eventNum, Model model) throws Exception {

		try {

			// 이벤트 게시글 가져오기
			Event dto = service.readEvent(eventNum);
			model.addAttribute("dto", dto);

		} catch (Exception e) {

		}
		return ".event.article";
	}

	// 댓글 리스트 : AJAX-TEXT
	@GetMapping("listReply")
	public String listReply(@RequestParam long eventNum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page, HttpSession session, Model model)
			throws Exception {

		SessionInfo info = (SessionInfo)session.getAttribute("member");

		int size = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("eventNum", eventNum);

		map.put("userCode", info.getUserCode());

		dataCount = service.replyCount(map);

		total_page = myUtil.pageCount(dataCount, size);

		if (current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<Reply> listReply = service.listReply(map);

		for (Reply dto : listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}

		// AJAX 용 페이징
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		// 포워딩할 jsp로 넘길 데이터
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("eventNum", eventNum);

		return "event/listReply";
	}

	// 댓글 및 댓글의 답글 등록 : AJAX-JSON
	@PostMapping("insertReply")
	@ResponseBody
	public Map<String, Object> insertReply(Reply dto, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		try {
			dto.setUserCode(info.getUserCode());
			
			
			service.insertReply(dto);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	// 댓글 및 댓글의 답글 삭제 : AJAX-JSON
	@PostMapping("deleteReply")
	@ResponseBody
	public Map<String, Object> deleteReply(@RequestParam Map<String, Object> paramMap) {
		String state = "true";

		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}

}
