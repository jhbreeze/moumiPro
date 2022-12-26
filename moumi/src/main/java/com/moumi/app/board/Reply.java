package com.moumi.app.board;

import org.springframework.web.multipart.MultipartFile;

public class Reply {
	private long replyNum;
	private String content;
	private String regDate;
	private long userCode;
	private long parent;
	private long communityNum;
	private int showReply;
	
	private int answerCount;
	private int likeCount;
	private int disLikeCount;
	private String nickName;
	
	private String fileName;
	private MultipartFile selectFile;
	
	public long getReplyNum() {
		return replyNum;
	}
	public String getContent() {
		return content;
	}
	public String getRegDate() {
		return regDate;
	}
	public long getUserCode() {
		return userCode;
	}
	public long getParent() {
		return parent;
	}
	public long getCommunityNum() {
		return communityNum;
	}
	public int getShowReply() {
		return showReply;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public int getDisLikeCount() {
		return disLikeCount;
	}
	public String getNickName() {
		return nickName;
	}
	public void setReplyNum(long replyNum) {
		this.replyNum = replyNum;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public void setUserCode(long userCode) {
		this.userCode = userCode;
	}
	public void setParent(long parent) {
		this.parent = parent;
	}
	public void setCommunityNum(long communityNum) {
		this.communityNum = communityNum;
	}
	public void setShowReply(int showReply) {
		this.showReply = showReply;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public void setDisLikeCount(int disLikeCount) {
		this.disLikeCount = disLikeCount;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getFileName() {
		return fileName;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	
	
	
}
