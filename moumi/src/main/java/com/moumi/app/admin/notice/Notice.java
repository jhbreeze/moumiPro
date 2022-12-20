package com.moumi.app.admin.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private long noticeNum;
	private long userCode;
	private String subject;
	private String content;
	private String regDate;
	private int notice;
	
	private long noticeFileNum;
	private List<MultipartFile> imageFileName;
	
	public long getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(long noticeNum) {
		this.noticeNum = noticeNum;
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
	public int getNotice() {
		return notice;
	}
	public void setNotice(int notice) {
		this.notice = notice;
	}
	public long getNoticeFileNum() {
		return noticeFileNum;
	}
	public void setNoticeFileNum(long noticeFileNum) {
		this.noticeFileNum = noticeFileNum;
	}
	public List<MultipartFile> getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(List<MultipartFile> imageFileName) {
		this.imageFileName = imageFileName;
	}
	
	

}
