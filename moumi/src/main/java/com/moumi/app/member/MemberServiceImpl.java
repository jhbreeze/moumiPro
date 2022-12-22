package com.moumi.app.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;
	

	@Override
	public Member loginMember(String userId) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.loginMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			long memberSeq = dao.selectOne("member.memberSeq");
			dto.setUserCode(memberSeq);
			
			// 패스워드 암호화

			// 회원정보 저장
			dao.insertData("member.insertMember", dto);
			
			// 권한 저장
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public Member readMember(String email) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.readMember", email);


		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	@Override
	public Member readMember(long userCode) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.readMember", userCode);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

//	updateUserType
	
	@Override
	public void updateLastLogin(String email) throws Exception {
		try {
			dao.updateData("member.updateLastLogin", email);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

//	updateMember

//	deleteMember
	
//	generatePwd

/*
	@Override
	public boolean isPasswordCheck(String email, String pwd) {
		Member dto = readMember(email);
		
		if(dto == null) {
			return false;
		}
		
		return bcrypt.matches(email, dto.getPwd());
	}
*/
//	updatePwd
	
	@Override
	public int checkFailureCount(String email) {
		int result = 0;
		
		try {
			result = dao.selectOne("member.checkFailureCount", email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void updateFailureCountReset(String email) throws Exception {
		try {
			dao.updateData("member.updateFailureCountReset", email);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMemberEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("member.updateMemberEnabled",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertMemberState(Member dto) throws Exception {
		try {
			dao.insertData("member.insertMemberState", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateFailureCount(String email) throws Exception {
		try {
			dao.updateData("member.updateFailureCount", email);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
	}

}
