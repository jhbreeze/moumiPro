package com.moumi.app.admin.memberManage;

import java.util.List;
import java.util.Map;

public interface MemberManageService {
	public int dataCount(Map<String, Object> map);
	public List<Member> listMember(Map<String, Object> map);
	
	public Member readMember(long userCode);
	
	public void updateFailureCountReset(long userCode) throws Exception;
	public void updateMemberEnabled(Map<String, Object> map) throws Exception;
	public void insertMemberState(Member dto) throws Exception;
	public List<Member> listMemberState(long userCode);
	public List<Member> listMemberSub(long userCode);
	public Member readMemberState(long userCode);

}
