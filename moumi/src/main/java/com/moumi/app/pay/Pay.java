package com.moumi.app.pay;

public class Pay {

	private long paymentNum;
	private int categoryNum;
	private int paymentPrice;
	private int discount;
	private String payDate;
	private String endDate;
	
	private String userName;
	private String email;
	private long userCode;
	
	private String subject;
	private String content;
	
	public long getPaymentNum() {
		return paymentNum;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public int getPaymentPrice() {
		return paymentPrice;
	}
	public int getDiscount() {
		return discount;
	}
	public String getPayDate() {
		return payDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public String getUserName() {
		return userName;
	}
	public String getEmail() {
		return email;
	}
	public long getUserCode() {
		return userCode;
	}
	public String getSubject() {
		return subject;
	}
	public String getContent() {
		return content;
	}
	public void setPaymentNum(long paymentNum) {
		this.paymentNum = paymentNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public void setPaymentPrice(int paymentPrice) {
		this.paymentPrice = paymentPrice;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setUserCode(long userCode) {
		this.userCode = userCode;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
	
	
	