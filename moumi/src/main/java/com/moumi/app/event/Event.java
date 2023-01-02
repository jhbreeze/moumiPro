package com.moumi.app.event;

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
	private int deadLine;
	private int deadLineABS;


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

	public int getDeadLine() {
		return deadLine;
	}

	public void setDeadLine(int deadLine) {
		this.deadLine = deadLine;
	}

	public int getDeadLineABS() {
		return deadLineABS;
	}

	public void setDeadLineABS(int deadLineABS) {
		this.deadLineABS = deadLineABS;
	}

	
}
