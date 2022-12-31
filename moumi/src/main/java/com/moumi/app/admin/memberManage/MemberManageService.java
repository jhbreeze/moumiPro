package com.moumi.app.admin.memberManage;

import java.util.List;
import java.util.Map;

public interface MemberManageService {
	public int dataCount(Map<String, Object> map);
	public List<Member> listMember(Map<String, Object> map);
	
	public Member readMember(String email);
	
	public void updateFailureCountReset(String email) throws Exception;
	public void updateMemberEnabled(Map<String, Object> map) throws Exception;
	public void insertMemberState(Member dto) throws Exception;
	public List<Member> listMemberState(String userCode);
	public Member readMemberState(String userCode);

}
