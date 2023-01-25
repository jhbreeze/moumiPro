package com.moumi.app.mypage.mycoupon;

public class MyCoupon {
	private long userCode;
	private String couponName;
	private long couponPrice;
	private String startDate;
	private String endDate;

	public long getUserCode() {
		return userCode;
	}

	public void setUserCode(long userCode) {
		this.userCode = userCode;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public long getCouponPrice() {
		return couponPrice;
	}

	public void setCouponPrice(long couponPrice) {
		this.couponPrice = couponPrice;
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

}
