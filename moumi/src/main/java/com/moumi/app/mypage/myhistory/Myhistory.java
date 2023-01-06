package com.moumi.app.mypage.myhistory;

public class Myhistory {
	private long communityNum;
	private long recruitNum;
	private String subject;
	private String nickName;
	private String regDate;
	private String content;
	
	private String corporation;
	private String startDate;
	private String endDate;
	
	public long getRecruitNum() {
		return recruitNum;
	}
	public void setRecruitNum(long recruitNum) {
		this.recruitNum = recruitNum;
	}
	private long categoryNum;
	
	private long userCode;
	
	private String tableName;
	
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getCorporation() {
		return corporation;
	}
	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(long categoryNum) {
		this.categoryNum = categoryNum;
	}
	public long getCommunityNum() {
		return communityNum;
	}
	public void setCommunityNum(long communityNum) {
		this.communityNum = communityNum;
	}
	public long getUserCode() {
		return userCode;
	}
	public void setUserCode(long userCode) {
		this.userCode = userCode;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
