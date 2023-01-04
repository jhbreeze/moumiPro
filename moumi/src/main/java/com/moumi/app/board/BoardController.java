package com.moumi.app.board;

import java.io.File;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moumi.app.common.MyUtil;
import com.moumi.app.member.SessionInfo;




@Controller("board.boardController")
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@Autowired
	private MyUtil myUtil;
	

	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value="page",defaultValue = "1") int current_page,
				@RequestParam(defaultValue = "all") String condition,
				@RequestParam(defaultValue = "") String keyword,HttpServletRequest req,Model model
				, HttpSession session,Board dto) throws Exception {
		
		
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
			dto.setNickName(info.getNickName());
			dto.setUserCode(info.getUserCode());

			 
			service.insertBoard(dto, pathname);
		} catch (Exception e) {
		}
		return "redirect:/board/list";
	}
	
	@GetMapping("article")
	public String article(@RequestParam long communityNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page=" + page;
		if(keyword.length() != 0) {
			query += "&condition=" + condition+
					"&keyword=" + URLEncoder.encode(keyword,"UTF-8");
		}
		service.updateHitCount(communityNum);
		
		Board dto = service.readBoard(communityNum);
		if(dto == null) {
			return "redirect:/board/list?"+ query;
		}
		
		// dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("communityNum", communityNum);
		
		Board preReadDto = service.preReadBoard(map);
		Board nextReadDto = service.nextReadBoard(map);
		
		map.put("userCode", info.getUserCode());
		boolean userBoardLiked = service.userBoardLiked(map);
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);

		model.addAttribute("userBoardLiked", userBoardLiked);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".board.article";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long communityNum,
				@RequestParam String page,
				HttpSession session,
				Model model) throws Exception {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			Board dto = service.readBoard(communityNum);
			if( dto == null || !(info.getUserCode() == dto.getUserCode())) {
				return "redirect:/board/list?page="+page;
			}
			
			model.addAttribute("dto",dto);
			model.addAttribute("mode","update");
			model.addAttribute("page",page);
			
			return ".board.write";
		
	}
	
	@PostMapping("update")
	public String updateSubmit(Board dto, @RequestParam String page,
			HttpSession session,HttpServletRequest req) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator+"board";
		
		try {
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
			service.updateBoard(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/board/list?page=" + page;
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam long communityNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		keyword = URLDecoder.decode(keyword,"utf-8");
		String query = "page=" + page;
		
		if(keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword,"UTF-8");
		}
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator+"board";
		
		service.deleteBoard(communityNum, pathname, (int) info.getUserCode(), info.getUserType());
		
		return "redirect:/board/list?" + query;
	}
	
	@RequestMapping("insertBoardLike")
	@ResponseBody
	public Map<String,Object> insertBoardLike(@RequestParam long communityNum,
				@RequestParam boolean userLiked, HttpSession session) {
		String  state = "true";
		int boardLikeCount = 0;
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("communityNum",communityNum);
		paramMap.put("userCode", info.getUserCode());
		
		try {
			if(userLiked) {
				service.deleteBoardLike(paramMap);
			} else {
				service.insertBoardLike(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		boardLikeCount = service.boardLikeCount(communityNum);
		Map<String,Object> model = new HashMap<String, Object>();
		model.put("state",state);
		model.put("boardLikeCount", boardLikeCount);
		
		return model;
	}
	
	@GetMapping("listReply")
	public String listReply(@RequestParam long communityNum, 
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session,
			Model model) throws Exception {

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int size = 3;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("communityNum", communityNum);
		
		map.put("userType", info.getUserType());
		map.put("userCode", info.getUserCode());
		

		dataCount = service.replyCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if (current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

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
		model.addAttribute("communityNum",communityNum);

		return "board/listReply";
	}

	// 댓글 및 댓글의 답글 등록 : AJAX-JSON
	@PostMapping("insertReply")
	@ResponseBody
	public Map<String, Object> insertReply(Reply dto, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator+"reply";

		try {
			dto.setUserCode(info.getUserCode());
			service.insertReply(dto,pathname);
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
		// 댓글의 답글 리스트 : AJAX-TEXT
		@GetMapping("listReplyAnswer")
		public String listReplyAnswer(@RequestParam Map<String, Object> paramMap, 
				HttpSession session, Model model) throws Exception {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			paramMap.put("userCode", info.getUserCode());
			
			List<Reply> listReplyAnswer = service.listReplyAnswer(paramMap);
			
			for (Reply dto : listReplyAnswer) {
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			}

			model.addAttribute("listReplyAnswer", listReplyAnswer);
			return "board/listReplyAnswer";
		}
		
		// 댓글의 답글 개수 : AJAX-JSON
		@PostMapping(value = "countReplyAnswer")
		@ResponseBody
		public Map<String, Object> countReplyAnswer(@RequestParam Map<String, Object> paramMap,
				HttpSession session) {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			paramMap.put("userCode", info.getUserCode());
			
			int count = service.replyAnswerCount(paramMap);

			Map<String, Object> model = new HashMap<>();
			model.put("count", count);
			return model;
		}
		
		// 댓글의 좋아요/싫어요 추가 : AJAX-JSON
		@PostMapping("insertReplyLike")
		@ResponseBody
		public Map<String, Object> insertReplyLike(@RequestParam Map<String, Object> paramMap,
				HttpSession session) {
			String state = "true";

			SessionInfo info = (SessionInfo) session.getAttribute("member");
			Map<String, Object> model = new HashMap<>();

			try {
				paramMap.put("userCode", info.getUserCode());
				service.insertReplyLike(paramMap);
			} catch (DuplicateKeyException e) {
				state = "liked";
			} catch (Exception e) {
				state = "false";
			}

			Map<String, Object> countMap = service.replyLikeCount(paramMap);

			// 마이바티스의 resultType이 map인 경우 int는 BigDecimal로 넘어옴
			int likeCount = ((BigDecimal) countMap.get("LIKECOUNT")).intValue();
			int disLikeCount = ((BigDecimal)countMap.get("DISLIKECOUNT")).intValue();
			
			model.put("likeCount", likeCount);
			model.put("disLikeCount", disLikeCount);
			model.put("state", state);
			return model;
		}
	
		@PostMapping("notify")
		@ResponseBody
		public Map<String,Object> notifyWrite(@RequestParam long parent,
				@RequestParam long communityNum,
				@RequestParam(defaultValue = "0") long parentNum , Board dto ,HttpSession session) {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			Map<String, Object> model = new HashMap<>();
			String state = "true";
			try {
				dto.setUserCode(info.getUserCode());
				dto.setReplyNum(parent);
				dto.setParent(parentNum);
				service.insertNotify(dto);
			} catch (Exception e) {
				state = "false";
			}
			model.put("state",state);
			
			return model;
		}
}
