package com.moumi.app;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Report {
	private long reportNum;
	private String subject;
	private String content;
	private String regDate;
	private int hitCount;
	private String thumbnail;
	private long userCode;
	private MultipartFile thumbnailFile;

	private long fileNum;
	private String imageFilename;
	private List<MultipartFile> addFiles;

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

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getImageFilename() {
		return imageFilename;
	}

	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}

	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}

	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}

	public List<MultipartFile> getAddFiles() {
		return addFiles;
	}

	public void setAddFiles(List<MultipartFile> addFiles) {
		this.addFiles = addFiles;
	}

}
