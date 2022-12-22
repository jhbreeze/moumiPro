package com.moumi.app.member;

// 세션에 저장할 정보(아이디, 이름, 권한 등)
public class SessionInfo {
	private long userCode;
	private String email;
	private String userName;
	private int userType;
	private String nickName;
	
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public long getUserCode() {
		return userCode;
	}
	public void setUserCode(long userCode) {
		this.userCode = userCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public String getNickName() {
		return nickName;
	}
}
