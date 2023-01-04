package com.moumi.app.admin.event;

public class Winner {
	private long eventNum;
	private long couponNum;
	private long userCode;
	private String winDate;
	private int pickCount;

	public long getEventNum() {
		return eventNum;
	}

	public void setEventNum(long eventNum) {
		this.eventNum = eventNum;
	}

	public long getCouponNum() {
		return couponNum;
	}

	public void setCouponNum(long couponNum) {
		this.couponNum = couponNum;
	}

	public long getUserCode() {
		return userCode;
	}

	public void setUserCode(long userCode) {
		this.userCode = userCode;
	}

	public String getWinDate() {
		return winDate;
	}

	public void setWinDate(String winDate) {
		this.winDate = winDate;
	}

	public int getPickCount() {
		return pickCount;
	}

	public void setPickCount(int pickCount) {
		this.pickCount = pickCount;
	}

}
