package com.moumi.app.admin.faq;

public class Faq {
	private long faqNum;
	private long userCode;
	private long categoryNum;
	private String subject;
	private String content;
	
	private String categoryName;

	public long getFaqNum() {
		return faqNum;
	}

	public void setFaqNum(long faqNum) {
		this.faqNum = faqNum;
	}

	public long getUserCode() {
		return userCode;
	}

	public void setUserCode(long userCode) {
		this.userCode = userCode;
	}

	public long getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(long categoryNum) {
		this.categoryNum = categoryNum;
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

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	

}
