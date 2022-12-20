package com.moumi.app.admin.report;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Report {
	private long reportNum;
	private String subject;
	private String content;
	private String regDate;
	private int hitCount;
	private MultipartFile thumbnail;
	private long userCode;
	
	private long fileNum;
	private List<MultipartFile> imageFilename;
	
	public long getReportNum() {
		return reportNum;
	}
	public void setReportNum(long reportNum) {
		this.reportNum = reportNum;
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
	public MultipartFile getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(MultipartFile thumbnail) {
		this.thumbnail = thumbnail;
	}
	public long getUserCode() {
		return userCode;
	}
	public void setUserCode(long userCode) {
		this.userCode = userCode;
	}
	public long getFileNum() {
		return fileNum;
	}
	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}
	public List<MultipartFile> getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(List<MultipartFile> imageFilename) {
		this.imageFilename = imageFilename;
	}
	
	
	
	

}
