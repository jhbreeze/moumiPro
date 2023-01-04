package com.moumi.app.admin.event;

import org.springframework.web.multipart.MultipartFile;

public class Event {
	private long eventNum;
	private long userCode;
	private String subject;
	private String content;
	private String regDate;
	private String startDate;
	private String endDate;
	private String price;
	private int hitCount;
	private MultipartFile thumbnailFile;
	private String thumbnail;
	private int endCheck;
	private int startCheck;
	private int pickCount;
	private int status;

	public long getEventNum() {
		return eventNum;
	}

	public void setEventNum(long eventNum) {
		this.eventNum = eventNum;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}

	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public int getEndCheck() {
		return endCheck;
	}

	public void setEndCheck(int endCheck) {
		this.endCheck = endCheck;
	}

	public int getStartCheck() {
		return startCheck;
	}

	public void setStartCheck(int startCheck) {
		this.startCheck = startCheck;
	}

	public int getPickCount() {
		return pickCount;
	}

	public void setPickCount(int pickCount) {
		this.pickCount = pickCount;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
