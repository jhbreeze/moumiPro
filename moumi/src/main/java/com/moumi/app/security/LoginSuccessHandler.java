package com.moumi.app.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.moumi.app.member.Member;
import com.moumi.app.member.MemberService;
import com.moumi.app.member.SessionInfo;


public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	@Autowired
	private MemberService service;
	
	private String defaultUrl;
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {

		// 로그인 날짜 변경
		try {
			// authentication.getName() : 로그인아이디
			service.updateLastLogin(authentication.getName());
		} catch (Exception e) {
		}
		
		// 세션에 로그인 유저 정보 저장
		HttpSession session = request.getSession();
		
		Member member = service.readMember(authentication.getName());
		
		SessionInfo info = new SessionInfo();
		info.setUserCode(member.getUserCode());
		info.setEmail(member.getEmail());
		info.setUserName(member.getUserName());
		info.setUserType(member.getUserType());
		info.setNickName(member.getNickName());
		
		session.setAttribute("member", info);
		// redirect 설정
		resultRedirectStrategy(request, response, authentication);
	}
	
	protected void resultRedirectStrategy(HttpServletRequest request, 
			HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		if(savedRequest != null) {
			// 로그인이 되지 않은 상태에서 권한이 필요한 페이지에 접근한 경우
			String targetUrl = savedRequest.getRedirectUrl();
			redirectStrategy.sendRedirect(request, response, targetUrl);
		} else {
			// 직접 로그인 주소를 클릭한 경우
			redirectStrategy.sendRedirect(request, response, defaultUrl);
		}
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

}
