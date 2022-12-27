package com.moumi.app.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("member.memberController")
@RequestMapping(value="/member/*")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "member")
	public String memberForm(Model model) {
		model.addAttribute("mode", "member");
		return ".member.member";
	}
	
	@RequestMapping(value = "member", method = RequestMethod.POST)
	public String memberSubmit(Member dto,
			final RedirectAttributes reAttr,
			Model model) {

		try {
			service.insertMember(dto);
		} catch (DuplicateKeyException e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "이메일 중복으로 회원가입이 실패했습니다.");
			return ".member.member";
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "제약 조건 위반으로 회원가입이 실패했습니다.");
			return ".member.member";
		} catch (Exception e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "회원가입이 실패했습니다.");
			return ".member.member";
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getUserName() + "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");

		// 리다이렉트된 페이지에 값 넘기기
		reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("title", "회원 가입");

		return "redirect:/member/complete";
	}
	
	
	@RequestMapping(value = "complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {

		if (message == null || message.length() == 0) // F5를 누른 경우
			return "redirect:/";

		return ".member.complete";
	}

	@RequestMapping(value = "login")
	public String loginForm() {
		return ".member.login";
	}

	@GetMapping("noAuthorized")
	public String noAuthorized() {
		return ".member.noAuthorized";
	}

	@GetMapping("expired")
	public String expired() {
		return ".member.expired";
	}

	@RequestMapping(value = "pwd", method = RequestMethod.POST)
	public String pwdSubmit(@RequestParam String pwd,
			@RequestParam String mode, 
			final RedirectAttributes reAttr,
			HttpSession session,
			Model model) {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Member dto = service.readMember(info.getEmail());
		if (dto == null) {
			session.invalidate();
			return "redirect:/";
		}

		boolean bPwd = service.isPasswordCheck(info.getEmail(), pwd);
		
		if ( ! bPwd ) {
			if (mode.equals("update")) {
				model.addAttribute("mode", "update");
			} else {
				model.addAttribute("mode", "dropout");
			}
			model.addAttribute("message", "패스워드가 일치하지 않습니다.");
			return ".member.pwd";
		}

		if (mode.equals("dropout")) {
			// 게시판 테이블등 자료 삭제

			// 회원탈퇴 처리
			/*
			 * Map<String, Object> map = new HashMap<>();
			 * map.put("memberIdx", info.getMemberIdx());
			 * map.put("userId", info.getUserId());
			 */

			// 세션 정보 삭제
			session.removeAttribute("member");
			session.invalidate();

			StringBuilder sb = new StringBuilder();
			sb.append(dto.getUserName() + "님의 회원 탈퇴 처리가 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동 하시기 바랍니다.<br>");

			reAttr.addFlashAttribute("title", "회원 탈퇴");
			reAttr.addFlashAttribute("message", sb.toString());

			return "redirect:/member/complete";
		}

		// 회원정보수정폼
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		return ".member.member";
	}

	
	
	@RequestMapping(value = "emailCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam String email) throws Exception {

		String p = "true";
		Member dto = service.readMember(email);
		if (dto != null) {
			p = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("passed", p);
		return model;
	}
	
	@RequestMapping(value = "nickNameCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> nickCheck(@RequestParam String nickName) throws Exception {
		
		String p = "true";
		Member dto = service.readMember1(nickName);
		if (dto != null) {
			p = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("passed", p);
		return model;
	}
	
	
	

}
