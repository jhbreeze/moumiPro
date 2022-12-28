package com.moumi.app.recruit;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
			HttpServletRequest req, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		model.addAttribute("pageNo", current_page);
		
		return ".recruit.main";
	}
	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "subject") String condition,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int div,
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
		map.put("div", div);
		
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
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
		model.addAttribute("pageNo", current_page);
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
		
		model.addAttribute("page", "1"); // checkhere
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
	public String article(@RequestParam long recruitNum, @RequestParam String pageNo,
			@RequestParam(defaultValue = "subject") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + pageNo;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		Recruit dto = service.readRecruit(recruitNum);
		if (dto == null) {
			return "redirect:/recruit/main?" + query;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("recruitNum", recruitNum);

		Recruit preReadDto = service.preReadRecruit(map);
		Recruit nextReadDto = service.nextReadRecruit(map);

		List<Recruit> listFile = service.listFile(recruitNum);
		int fileCount = service.countFile(recruitNum);
		dto.setFileCount(fileCount);
			
		// 게시글 공감 여부
		map.put("userCode", info.getUserCode());
		boolean userRecruitLiked = service.userRecruitLiked(map);
		
		// 게시글 공감 개수
		int recruitLikeCount = 0;
		recruitLikeCount = service.recruitLikeCount(recruitNum);
		dto.setRecruitLikeCount(recruitLikeCount);

		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("fileCount", fileCount);

		model.addAttribute("userRecruitLiked", userRecruitLiked);
		
		model.addAttribute("page", pageNo);
		model.addAttribute("query", query);
		
		return ".recruit.article";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long recruitNum, @RequestParam String page,
			HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Recruit dto = service.readRecruit(recruitNum);
		if(dto == null || (info.getUserType()!= 0 && (info.getUserCode() != dto.getUserCode()))) { // 관리자가 아니거나 로그인 상태의 회사가 자기가 쓴 글 아니라면 
			return "redirect:/recruit/main?page="+page;
		}
		
		List<Recruit> listCategory = service.listCareerCategory(); 
		List<Recruit> listFile = service.listFile(recruitNum);
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listFile", listFile);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".recruit.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(Recruit dto, @RequestParam String page, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		if (dto == null || (info.getUserType() != 0 && (info.getUserCode() != dto.getUserCode()))) { // 관리자가 아니거나 로그인 상태의 회사가 자기가 쓴 글 아니라면
			return "redirect:/recruit/main?page=" + page;
		}

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "recruit";

			dto.setUserCode(info.getUserCode());
			service.updateRecruit(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/recruit/main?page=" + page;
	}
	
	@PostMapping(value = "deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long fileNum, HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "recruit";

		Recruit dto = service.readFile(fileNum);
		if (dto != null) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
		}

		String state = "false";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "fileNum");
			map.put("fileNum", fileNum);
			service.deleteFile(map);
			state = "true";
		} catch (Exception e) {
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);

		return model;
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam long recruitNum, @RequestParam String page,
			@RequestParam(defaultValue = "subject") String condition, @RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "recruit";

			service.deleteRecruit(recruitNum, pathname);
		} catch (Exception e) {
		}

		return "redirect:/recruit/main?" + query;
	}
	
	@RequestMapping(value = "download")
	public void download(@RequestParam long fileNum, HttpServletResponse resp, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "recruit";
		
		boolean b = false;
		
		Recruit dto = service.readFile(fileNum);
		if(dto != null) {
			String saveFilename = dto.getSaveFilename();
			String originalFilename = dto.getOriginalFilename();
			
			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		
		if (! b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능합니다.');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	@RequestMapping(value = "zipdownload")
	public void zipdownload(@RequestParam long recruitNum, @RequestParam long fileNum,
			HttpServletResponse resp, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "recruit";

		boolean b = false;

		List<Recruit> listFile = service.listFile(recruitNum);
		if (listFile.size() > 0) {
			String[] sources = new String[listFile.size()];
			String[] originals = new String[listFile.size()];
			String zipFilename = recruitNum + ".zip";

			for (int idx = 0; idx < listFile.size(); idx++) {
				sources[idx] = pathname + File.separator + listFile.get(idx).getSaveFilename();
				originals[idx] = File.separator + listFile.get(idx).getOriginalFilename();
			}

			b = fileManager.doZipFileDownload(sources, originals, zipFilename, resp);
		}

		if (! b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	@PostMapping("insertRecruitLike")
	@ResponseBody
	public Map<String, Object> insertRecruitLike(@RequestParam long recruitNum, @RequestParam boolean userLiked,
			HttpSession session) {
		
		String state = "true";
		int recruitLikeCount = 0;
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("recruitNum", recruitNum);
		paramMap.put("userCode", info.getUserCode());
		
		try {
			if(userLiked) {
				service.deleteRecruitLike(paramMap);
			} else {
				service.insertRecruitLike(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		recruitLikeCount = service.recruitLikeCount(recruitNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("recruitLikeCount", recruitLikeCount);
		
		return model;
	}

	
}
