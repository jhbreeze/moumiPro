package com.moumi.app.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;
import com.moumi.app.mail.Mail;
import com.moumi.app.mail.MailSender;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;

	@Autowired
	private BCryptPasswordEncoder bcrypt;

	@Autowired
	private MailSender mailSender;

	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			long memberSeq = dao.selectOne("member.memberSeq");
			dto.setUserCode(memberSeq);

			// 패스워드 암호화
			String encPassword = bcrypt.encode(dto.getPwd());
			dto.setPwd(encPassword);

			dto.setEnabled(1);
			// 회원정보 저장
			dao.insertData("member.insertMember", dto);

			// 권한 저장
			dto.setAuthority("ROLE_USER");
			dao.insertData("member.insertAuthority", dto);

			String result;
			result = dto.getUserName() + "님, 회원가입 성공! <b>";
			Mail mail = new Mail();
			mail.setReceiverEmail(dto.getEmail());

			mail.setSenderEmail("@naver.com");
			mail.setSenderName("MOUMI 관리자");
			mail.setSubject("회원가입 성공 메일");
			mail.setContent(result);

			boolean b = mailSender.mailSend(mail);
			if (!b) {
				throw new Exception("이메일 전송중 오류가 발생했습니다.");
			}

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
	public Member readMember1(String nickName) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.readMember1", nickName);

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

	@Override
	public void updateMember(Member dto) throws Exception {
		try {
			boolean bPwdUpdate = !isPasswordCheck(dto.getEmail(), dto.getPwd());
			if (bPwdUpdate) {
				// 패스워드가 변경된 경우에만 member1 수정
				String encPassword = bcrypt.encode(dto.getPwd());
				dto.setPwd(encPassword);

				dao.updateData("member.updateMember1", dto);
			}

			dao.updateData("member.updateMember2", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

//	deleteMember

//	generatePwd

	@Override
	public boolean isPasswordCheck(String email, String pwd) {
		Member dto = readMember(email);

		if (dto == null) {
			return false;
		}

		return bcrypt.matches(pwd, dto.getPwd());
	}

//	updatePwd
	@Override
	public void updatePwd(Member dto) throws Exception {
		try {

			if (isPasswordCheck(dto.getEmail(), dto.getPwd())) {
				throw new RuntimeException("패스워드가 기존 패스워드와 일치 합니다.");
			}

			String encPassword = bcrypt.encode(dto.getPwd());
			dto.setPwd(encPassword);

			dao.updateData("member.updateMember1", dto);

		} catch (Exception e) {
			e.printStackTrace();

			throw e;
		}

	}

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

	}

	@Override
	public void insertMemberState(Member dto) throws Exception {

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

	@Override
	public Member readMypage(String email) throws Exception {
		Member dto = null;
		try {
			dto = dao.selectOne("member.readMember", email);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

}
