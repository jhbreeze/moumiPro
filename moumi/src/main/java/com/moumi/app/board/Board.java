package com.moumi.app.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Board {

	private long communityNum;
	private long userCode;
	private String subject;
	private String content;
	private String regDate;
	private int hitCount;
	private String brandName;
	private int brandNum;
	private String nickName;
	
	private String fileName;
	private List<MultipartFile> selectFile;
	
	private int replyCount;
	private int boardLikeCount;
	
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public int getBrandNum() {
		return brandNum;
	}
	public void setBrandNum(int brandNum) {
		this.brandNum = brandNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getBoardLikeCount() {
		return boardLikeCount;
	}
	public void setBoardLikeCount(int boardLikeCount) {
		this.boardLikeCount = boardLikeCount;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	
	
}
