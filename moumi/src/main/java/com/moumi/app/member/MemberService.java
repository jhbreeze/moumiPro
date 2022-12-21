package com.moumi.app.member;

public interface MemberService {
	public Member loginMember(String userId);
	
	public void insertMember(Member dto) throws Exception;
	
	public Member readMember(String email);
	public Member readMember(long userCode);
	
	
	
}
