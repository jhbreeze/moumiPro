package com.moumi.app.admin.comment;

public class Comment {
	private long stopNum;
	private String content;
	private String userName;
	private int reply;
	private long userCode;
	private String subject;
	private String brandName;
	private long communityNum;
	
	public long getStopNum() {
		return stopNum;
	}
	public void setStopNum(long stopNum) {
		this.stopNum = stopNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
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
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public long getCommunityNum() {
		return communityNum;
	}
	public void setCommunityNum(long communityNum) {
		this.communityNum = communityNum;
	}
	
	

}
