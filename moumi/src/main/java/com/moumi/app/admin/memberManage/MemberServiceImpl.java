package com.moumi.app.admin.memberManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;

@Service("admin.memberManage.memberManageService")
public class MemberServiceImpl implements MemberManageService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("memberManage.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Member> listMember(Map<String, Object> map) {
		List<Member> list = null;
		
		try {
			list = dao.selectList("memberManage.listMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Member readMember(long userCode) {
		Member dto = null;
		
		try {
			dto = dao.selectOne("memberManage.readMember", userCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateFailureCountReset(long userCode) throws Exception {
		try {
			dao.updateData("memberManage.updateFailureCountReset", userCode);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateMemberEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("memberManage.updateMemberEnabled", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertMemberState(Member dto) throws Exception {
		try {
			dao.updateData("memberManage.insertMemberState", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Member> listMemberState(long userCode) {
		List<Member> list = null;
		
		try {
			list = dao.selectList("memberManage.listMemberState", userCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Member readMemberState(long userCode) {
		Member dto = null;
		
		try {
			dto = dao.selectOne("memberManage.readMemberState", userCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Member> listMemberSub(long userCode) {
		List<Member> list = null;
		
		try {
			list = dao.selectList("memberManage.listMemberSub", userCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
