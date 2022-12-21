package com.moumi.app.member;

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
			dao.insertData("member.insertMember", memberSeq);

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

	
		
}
