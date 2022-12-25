package com.moumi.app.recruit;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Recruit {
	private long recruitNum;
	private String subject;
	private String content;
	private String reg_date;
	private String corporation;
	private String startDate;
	private String endDate;
	private String email;
	
	private long userCode;
	private int userType;
	
	private long categoryNum;
	private String career;
	
	private long fileNum;
	private String imageFilename; 
	private List<MultipartFile> selectFile;
	
	private int recruitLikeCount;

	public long getrecruitNum() {
		return recruitNum;
	}

	public void setrecruitNum(long num) {
		this.recruitNum = num;
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

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getUserCode() {
		return userCode;
	}

	public void setUserCode(long userCode) {
		this.userCode = userCode;
	}

	public String getCorporation() {
		return corporation;
	}

	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}

	public long getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(long categoryNum) {
		this.categoryNum = categoryNum;
	}

	public String getImageFilename() {
		return imageFilename;
	}

	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}

	public int getRecruitLikeCount() {
		return recruitLikeCount;
	}

	public void setRecruitLikeCount(int recruitLikeCount) {
		this.recruitLikeCount = recruitLikeCount;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public long getFileNum() {
		return fileNum;
	}

	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}

	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}

	
}
